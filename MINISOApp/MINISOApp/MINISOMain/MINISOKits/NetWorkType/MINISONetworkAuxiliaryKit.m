//
//  MINISONetworkAuxiliaryKit.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISONetworkAuxiliaryKit.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "NSString+MINISOExtensions.h"


@implementation MINISONetworkAuxiliaryKit

+ (NSString *)carrierName {
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    NSString *currentCarrierName =[carrier carrierName];
    return currentCarrierName;
}

+ (mobileOperatorsType)getMobileOperatorsType {
    NSString *currentCarrierName =[self carrierName];
    mobileOperatorsType currentOperatorsType = mobileOperatorsTypeUnknow;
    if ([currentCarrierName rangeOfString:@"中国移动"].length) {
        currentOperatorsType = mobileOperatorsTypeChinaMobile;
    }else if ([currentCarrierName rangeOfString:@"中国联通"].length) {
        currentOperatorsType = mobileOperatorsTypeChinaUnicom;
    }else if ([currentCarrierName rangeOfString:@"中国电信"].length) {
        currentOperatorsType = mobileOperatorsTypeChinaTelecom;
    }
    return currentOperatorsType;
}

+ (NSString *)URLEncodedStringFromParameterDictionary:(NSDictionary *)parameterDictionary URLPrefix:(NSString *)URLPrefix {
    NSMutableString *returnStr = nil;
    if (!URLPrefix) {
        returnStr = [NSMutableString string];
    }else {
        if (![URLPrefix isBlankString]) {
            if ([URLPrefix rangeOfString:@"?"].length) {
                returnStr = [NSMutableString stringWithFormat:@"%@%@", URLPrefix, @"&"];
            } else {
                returnStr = [NSMutableString stringWithFormat:@"%@%@", URLPrefix, @"?"];
            }
        }else {
            returnStr = [NSMutableString string];
        }
    }
    
    NSInteger i = [parameterDictionary.allKeys count];
    for (NSString *key in parameterDictionary.allKeys) {
        i--;
        
        id value = [parameterDictionary valueForKey:key];
        NSString *stringValue = [NSString stringWithFormat:@"%@", value];
        // 拼接 参数的key-value，并且对value进行urlencode
        if (i > 0) {
            [returnStr appendFormat:@"%@=%@&", key, [stringValue urlEncodedString]];
            
        }else {
            [returnStr appendFormat:@"%@=%@", key, [stringValue urlEncodedString]];
        }
    }
    return returnStr;
}

+ (NSString *)URLEncodedParametersStringFromParametersDictonary:(NSDictionary *)parametersDictionary {
    return [self URLEncodedStringFromParameterDictionary:parametersDictionary URLPrefix:nil];
}

+ (NSString *)generateSignWithParametersDict:(NSDictionary *)parametersDict appSecretKey:(NSString *)appsecret {
    NSMutableString *sign = [NSMutableString string];
    NSArray *keys = [parametersDict allKeys];
    keys = [keys sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *key in keys) {
        if ([key isEqualToString:@"sign"]) {
            continue;
        }
        NSString *value = [parametersDict objectForKey:key];
        [sign appendFormat:@"%@%@", key, [value urlEncodedString]];
    }
    [sign appendString:appsecret];
    return [[sign MD5] uppercaseString];
}

+ (NSString *)contentTypeOfFileExtension:(NSString *)fileExtension {
    if (!fileExtension.length) {
        return @"application/octet-stream";
    }
    NSString *UTI = (__bridge_transfer NSString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)fileExtension, NULL);
    NSString *contentType = (__bridge_transfer NSString *)UTTypeCopyPreferredTagWithClass((__bridge CFStringRef)UTI, kUTTagClassMIMEType);
    if (!contentType) {
        return @"application/octet-stream";
    } else {
        return contentType;
    }

}

@end
