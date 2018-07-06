//
//  MINISONetworkAuxiliaryKit.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, mobileOperatorsType) { // 运营商类型
    mobileOperatorsTypeUnknow,       // 未知
    mobileOperatorsTypeChinaMobile,  // 中国移动
    mobileOperatorsTypeChinaUnicom,  // 中国联通
    mobileOperatorsTypeChinaTelecom, // 中国电信
};

@interface MINISONetworkAuxiliaryKit : NSObject

/**
 运营商名字
 
 @return 中国移动、中国联通、中国电信...
 */
+ (NSString *)carrierName;

/**
 运营商类型
 
 @return mobileOperatorsType
 */
+ (mobileOperatorsType)getMobileOperatorsType;


/**
 拼接get请求的url路径以及参数（并且会对参数值进行urlencoded）
 
 @param parameterDictionary 参数字典
 @param URLPrefix url路径
 @return 拼接好的字符串
 */
+ (NSString *)URLEncodedStringFromParameterDictionary:(NSDictionary *)parameterDictionary URLPrefix:(NSString *)URLPrefix;


/**
 将post请求参数拼接成字符串（并且会对参数值进行urlencoded）
 
 @param parametersDictionary 参数字典
 @return 拼接好的字符串
 */
+ (NSString *)URLEncodedParametersStringFromParametersDictonary:(NSDictionary *)parametersDictionary;


/**
 接口签名生成
 
 @param parametersDict 参数字典
 @param appsecret appsecret
 @return 按签名方式生成好的sign
 */
+ (NSString *)generateSignWithParametersDict:(NSDictionary *)parametersDict appSecretKey:(NSString *)appsecret;


/**
 根据文件扩展名生成对应的contentType
 
 @param fileExtension 文件扩展名
 @return contentType
 */
+ (NSString *)contentTypeOfFileExtension:(NSString *)fileExtension;

@end
