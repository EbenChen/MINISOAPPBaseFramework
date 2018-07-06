//
//  NSMutableDictionary+MINISOExtensions.m
//  MINISOApp
//
//  Created by Eben chen on 2018/7/2.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "NSMutableDictionary+MINISOExtensions.h"
#import "NSObject+MINISOExtensions.h"

@implementation NSMutableDictionary (MINISOExtensions)

- (void)setStringObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    if (!aKey) {
        return;
    }
    
    if ([NSObject isNSNumberClass:anObject]) {
        [self setObject:[((NSNumber *)anObject) stringValue] forKey:aKey];
        return;
    }
    
    if (anObject == nil || [NSObject isNSNullClass:anObject] || ![NSObject isNSStringClass:anObject]) {
        [self setObject:@"" forKey:aKey];
    } else {
        [self setObject:anObject forKey:aKey];
    }
}

- (void)setNotNilObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (aKey == nil || anObject == nil || [NSObject isNSNullClass:anObject]) {
        return;
    } else {
        [self setObject:anObject forKey:aKey];
    }
}


@end
