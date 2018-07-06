//
//  NSObject+MINISOExtensions.h
//  MINISOApp
//
//  Created by Eben chen on 2018/7/2.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MINISOExtensions)

//判断类型是否匹配
+(BOOL)isNSStringClass:(id)object;
+(BOOL)isNSDictionaryClass:(id)object;
+(BOOL)isNSNumberClass:(id)object;
+(BOOL)isNSNullClass:(id)object;
+(BOOL)isNSArrayClass:(id)object;

- (NSString *)stringForValue:(id)value;
- (BOOL)boolForValue:(id)value;
- (int)intForValue:(id)value;

@end
