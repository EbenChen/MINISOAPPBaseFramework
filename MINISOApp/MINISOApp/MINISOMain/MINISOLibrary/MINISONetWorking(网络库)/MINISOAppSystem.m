//
//  MINISOAppSystem.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/27.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOAppSystem.h"
#import <UIKit/UIKit.h>
#import <AdSupport/AdSupport.h>
#import "MINISOApiConfig.h"
#import "NSString+MINISOExtensions.h"
#import "UIDevice+MINISOExtensions.h"
#import "MINISONetworkTypeKit.h"
#import "MINISONetworkAuxiliaryKit.h"
#include "OpenUDID.h"


@implementation MINISOAppSystem

static NSString * const kAFCharactersToBeEscapedInQueryString =@":/?&=;+!@#$()',*";
static NSString * AFPercentEscapedQueryStringValueFromStringWithEncoding(NSString *string, NSStringEncoding encoding) {
    return (__bridge_transfer  NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string, NULL, (__bridge CFStringRef)kAFCharactersToBeEscapedInQueryString, CFStringConvertNSStringEncodingToEncoding(encoding));
}

static NSString *serviceTimeSpace = nil;

+ (NSString *)getAppShortVersion {
    return [NSString stringWithFormat:@"%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
}

+ (NSString *)getUserAgent {
    NSString * version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString * userAgent = [NSString stringWithFormat:@"pregnancy/%@ (%@; iOS %@; Scale/%0.2f)",version, [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] ? [[UIScreen mainScreen] scale] : 1.0f)];
    return userAgent;
}

+ (void)setServiceTimeInterval:(NSTimeInterval)timeInterval {
    serviceTimeSpace = [NSString stringWithFormat:@"%ld",(long)timeInterval];
}

+ (NSInteger)getServiceTimeInterval {
    return [serviceTimeSpace integerValue];
}

+ (NSString *)getSystemSecretKey:(SYSTEMKEY)secretkey {
    switch (secretkey) {
        case MINISO_APP_SECURE_KEY:
            return @"ySgDofJPrIqABICbYlsF4xUbACthIQRo";
            break;
        case MINISO_OA_SECURE_KEY:
            return @"%3y@.S9-XnUg@~7Y";
            break;
        case MINISO_SAP_SECURE_KEY:
            return @"Zi-Qft-asF_PL_FvLfupb2vP__ke";//statis1统计
            break;
        default:
            return nil;
            break;
    }
    
    return nil;
}

+ (NSDictionary *)getSystemParameterData {
    NSMutableDictionary * data = [[NSMutableDictionary alloc] initWithCapacity:0];
    //系统级参数
    [data setObject:[NSString stringWithFormat:@"%d",MINISO_API_DEVICE_SOURCE] forKey:@"source"];
    NSString *t;
    if (serviceTimeSpace) {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval appTime = now + [serviceTimeSpace longLongValue];
        t = [NSString stringWithFormat:@"%ld", (long)appTime];
    } else {
        t = [[NSDate date] appTimeInterval];
    }
    [data setObject:t forKey:@"t"];
    [data setObject:[OpenUDID value] forKey:@"device_id"];
    [data setObject:[MINISOAppSystem getAppShortVersion] forKey:@"version"];
    [data setObject:@"pt_iphone" forKey:@"appkey"];
    
   
    NSString *deviceName = [UIDevice deviceName];
    [data setObject:deviceName ? deviceName : @"" forKey:@"statistics_device_model"];
    
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    [data setObject:systemVersion forKey:@"statistics_os_version"];
    
    NSString *networkType = [MINISONetworkTypeKit networkType];
    if ([networkType isEqualToString:@"0"] || !networkType) {
        networkType = @"unknown";
    }
    [data setObject:networkType forKey:@"statistics_network_type"];
    
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    [data setObject:idfa ? idfa : @"" forKey:@"statistics_ios_idfa"];
    
    [data setObject:@"AppStore" forKey:@"statistics_app_channel"];
    
    [data setObject:@"pt_iphone" forKey:@"statistics_app_source"];
    
    mobileOperatorsType mobileOperatorsType = [MINISONetworkAuxiliaryKit getMobileOperatorsType];
    NSString *carrier;
    switch (mobileOperatorsType) {
        case mobileOperatorsTypeUnknow:
            carrier = @"Unknown";
            break;
        case mobileOperatorsTypeChinaMobile:
            carrier = @"ChinaMobile";
            break;
        case mobileOperatorsTypeChinaUnicom:
            carrier = @"ChinaUnicom";
            break;
        case mobileOperatorsTypeChinaTelecom:
            carrier = @"ChinaTelecom";
            break;
    }
    [data setObject:carrier forKey:@"statistics_carrier"];
    
    NSString *longitude = [NSString stringWithFormat:@"%g", [[NSUserDefaults standardUserDefaults] floatForKey:@"PHLongitudeUserDefaultsKey"]];
    [data setObject:longitude forKey:@"statistics_longitude"];
    NSString *latitude = [NSString stringWithFormat:@"%g", [[NSUserDefaults standardUserDefaults] floatForKey:@"PHLatitudeUserDefaultsKey"]];
    [data setObject:latitude forKey:@"statistics_latitude"];
    
    //系统统一参数初始化
    DEFAULT_USERAGENT_SETTING;
    SYNC_DEFAULT_USERAGENT;
    return data;
}

+ (NSString *)appendSign:(NSDictionary *)parameterDic withAppSecretKey:(NSString *)appSecret {
    NSMutableString *sign = [NSMutableString string];
    NSArray *keys = [parameterDic allKeys];
    keys = [keys sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *key in keys) {
        if ([key isEqualToString:@"sign"]) {
            continue;
        }
        NSString *keyValue = [NSString stringWithFormat:@"%@",[parameterDic valueForKey:key]];
        [sign appendFormat:@"%@%@", key, AFPercentEscapedQueryStringValueFromStringWithEncoding(keyValue,NSUTF8StringEncoding)];
    }
    [sign appendString:appSecret];
    return [[sign MD5] uppercaseString];
}

+ (NSString *)GetURLBySeparateFromDic:(NSDictionary *)parameterDic withURLPrefix:(NSString *)urlPrefix {
    NSMutableString *returnStr = nil;
    if (!urlPrefix) {
        returnStr = [NSMutableString string];
    } else {
        if (![urlPrefix isBlankString]) {
            if ([urlPrefix rangeOfString:@"?"].length) {
                returnStr=[NSMutableString stringWithFormat:@"%@%@",urlPrefix,@"&"];
            } else {
                returnStr=[NSMutableString stringWithFormat:@"%@%@",urlPrefix,@"?"];
            }
        } else {
            returnStr=[NSMutableString stringWithFormat:@""];
        }
    }
    
    NSInteger i = [parameterDic.allKeys count];
    NSString * vStr = nil;
    for (NSString *key in parameterDic.allKeys) {
        i--;
        vStr = nil;
        //如果不是NSString，结束本次循环，执行下一次循环
        if (![[parameterDic valueForKey:key] isKindOfClass:[NSString class]]) {
            continue;
        }
        //防止value为NSNumber
        vStr = [NSString stringWithFormat:@"%@",[parameterDic valueForKey:key]];
        // 拼接 参数的key-value，并且对value进行encode
        if ( i > 0) {
            [returnStr appendFormat:@"%@=%@&",key,AFPercentEscapedQueryStringValueFromStringWithEncoding(vStr, NSUTF8StringEncoding)];
        } else {
            [returnStr appendFormat:@"%@=%@",key,AFPercentEscapedQueryStringValueFromStringWithEncoding(vStr, NSUTF8StringEncoding)];
        }
        
    }
    return returnStr;
}

+ (NSString *)GetURLByKeyAscendingOrderSeparateFromDic:(NSDictionary *)parameterDic withURLPrefix:(NSString *)urlPrefix {
    NSMutableString *returnStr = nil;
    if (!urlPrefix) {
        returnStr = [NSMutableString string];
    } else {
        if (![urlPrefix isBlankString]) {
            if ([urlPrefix rangeOfString:@"?"].length) {
                returnStr=[NSMutableString stringWithFormat:@"%@%@",urlPrefix,@"&"];
            } else {
                returnStr=[NSMutableString stringWithFormat:@"%@%@",urlPrefix,@"?"];
            }
        } else {
            returnStr=[NSMutableString stringWithFormat:@""];
        }
    }
    
    NSInteger i = [parameterDic.allKeys count];
    NSString * vStr = nil;
    NSArray *keys = [parameterDic allKeys];
    keys = [keys sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *key in keys) {
        i--;
        vStr = nil;
        //如果不是NSString，结束本次循环，执行下一次循环
        if (![[parameterDic valueForKey:key] isKindOfClass:[NSString class]]) {
            continue;
        }
        //防止value为NSNumber
        vStr = [NSString stringWithFormat:@"%@",[parameterDic valueForKey:key]];
        // 拼接 参数的key-value，并且对value进行encode
        if (i > 0) {
            [returnStr appendFormat:@"%@=%@&",key,AFPercentEscapedQueryStringValueFromStringWithEncoding(vStr, NSUTF8StringEncoding)];
        } else {
            [returnStr appendFormat:@"%@=%@",key,AFPercentEscapedQueryStringValueFromStringWithEncoding(vStr, NSUTF8StringEncoding)];
        }
        
    }
    return returnStr;
}

+ (id)getMINISOAppDefaultByKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

+ (void)setMINISOAppDefaultWithObject:(id)object forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:key];
    [defaults synchronize];

}

@end
