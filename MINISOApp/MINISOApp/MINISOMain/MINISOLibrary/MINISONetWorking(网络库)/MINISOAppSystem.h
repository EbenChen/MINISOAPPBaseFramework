//
//  MINISOAppSystem.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/27.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+MINISOExtensions.h"

typedef NS_ENUM(NSInteger, SYSTEMKEY) {
    MINISO_APP_SECURE_KEY = 1,
    MINISO_OA_SECURE_KEY = 2,
    MINISO_SAP_SECURE_KEY = 3,
};

@interface MINISOAppSystem : NSObject

//获取app版本号
+ (NSString *)getAppShortVersion;

/**
 * 获取User-agent
 **/
+ (NSString *)getUserAgent;

/**
 * 设置系统时间差
 **/
+ (void)setServiceTimeInterval:(NSTimeInterval)timeInterval;

/**
 * 获取系统时间差
 **/
+ (NSInteger)getServiceTimeInterval;

/**
 * 获取API接口必传参数称为APP系统级别参数
 **/
+ (NSDictionary *)getSystemParameterData;

/**
 * 获取设备相关信息
 **/
+ (NSDictionary *)getDeviceInformation;

/**
 *  获得加密key
 *
 *  @param secretkey SYSTEMKEY
 *
 *  @return key
 */
+ (NSString *)getSystemSecretKey:(SYSTEMKEY)secretkey;

/**
 *  获取MD5加密数据
 *
 *  @param parameterDic 数据
 *  @param appSecret 接口分配的密钥
 *
 *  @return 加密数据
 */
+ (NSString *)appendSign:(NSDictionary *)parameterDic withAppSecretKey:(NSString *)appSecret;

/**
 *  把字典参数加到url后面
 *
 *  @param parameterDic 数据
 *  @param urlPrefix url前部
 *
 *  @return 整合好的url
 */
+ (NSString *)GetURLBySeparateFromDic:(NSDictionary *)parameterDic withURLPrefix:(NSString *)urlPrefix;

/**
 把字典参数加到url后面（按key升序拼接）
 
 @param parameterDic 数据
 @param urlPrefix url前部
 @return 整合好的url
 */
+ (NSString *)GetURLByKeyAscendingOrderSeparateFromDic:(NSDictionary *)parameterDic withURLPrefix:(NSString *)urlPrefix;

/**
 *  获得NSUserDefaults的值
 *
 *  @param key str
 *
 *  @return str
 */
+ (id)getMINISOAppDefaultByKey:(NSString *)key;

/**
 *  设置NSUserDefaults值
 *
 *  @param object id
 *  @param key    str
 */
+ (void)setMINISOAppDefaultWithObject:(id)object forKey:(NSString *)key;


@end
