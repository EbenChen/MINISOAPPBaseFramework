//
//  NSString+MINISOExtensions.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/27.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>

@interface NSString (MINISOExtensions)

- (NSString *) MD5;

/**
 判断字符串是否为空
 
 @return bool
 */
- (BOOL)isBlankString;

/**
 对字符串进行urlEncoded（特殊字符进行UTF-8编码）
 
 @return 编码后的字符串
 */
- (NSString *)urlEncodedString;

/**
 字符串是否包含英文字符
 
 @return bool
 */
- (BOOL)isContainsEnglishCharacter;

@end
