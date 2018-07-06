//
//  NSObject+MINISOExtensions.m
//  MINISOApp
//
//  Created by Eben chen on 2018/7/2.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "NSObject+MINISOExtensions.h"

@implementation NSObject (MINISOExtensions)

+(BOOL)isNSStringClass:(id)object
{
    if ([object isKindOfClass:[NSString class]]) {
        return YES;
    }
    else
        return NO;
}

+(BOOL)isNSDictionaryClass:(id)object
{
    if ([object isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    else
        return NO;
}

+(BOOL)isNSNumberClass:(id)object
{
    if ([object isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    else
        return NO;
}

+(BOOL)isNSNullClass:(id)object
{
    if ([object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    else
        return NO;
}

+(BOOL)isNSArrayClass:(id)object
{
    if ([object isKindOfClass:[NSArray class]]) {
        return YES;
    }
    else
        return NO;
}

- (BOOL)boolForValue:(id)value{
    if (value == nil || [NSObject isNSNullClass:value]) {
        return 0;
    } else if ([NSObject isNSStringClass:value]) {
        return [value boolValue];
    } else if ([NSObject isNSNumberClass:value]) {
        return [value boolValue];
    }
    return NO;
}

- (NSString *)stringForValue:(id)value {
    if (value == nil || [NSObject isNSNullClass:value]) {
        return @"";
    } else if ([NSObject isNSStringClass:value]) {
        return value;
    } else if ([NSObject isNSNumberClass:value]) {
        return [value stringValue];
    }
    return @"";
}

- (int)intForValue:(id)value {
    if (value == nil || [NSObject isNSNullClass:value]) {
        return 0;
    } else if ([NSObject isNSStringClass:value]) {
        return [value intValue];
    } else if ([NSObject isNSNumberClass:value]) {
        return [value intValue];
    }
    return 0;
}

@end
