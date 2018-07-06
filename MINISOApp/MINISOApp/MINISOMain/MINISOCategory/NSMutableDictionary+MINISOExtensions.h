//
//  NSMutableDictionary+MINISOExtensions.h
//  MINISOApp
//
//  Created by Eben chen on 2018/7/2.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (MINISOExtensions)

/**
 *  对一个key设置非空的字符串值，如果anobject为NSNumber,则设置为[NSNumber stringValue], 如果anobject为nil或者其他类型，则设置为@"",如果akey为nil, 则不设直接返回;
 @param anObject    要设置的值
 @param aKey        要设置的key
 */

- (void)setStringObject:(id)anObject forKey:(id<NSCopying>)aKey;


/**
 *  对一个key设置非空值, 如果anobject为nil活着akey为nil, 则不设直接返回;
 @param anObject    要设置的值
 @param aKey        要设置的key
 */
- (void)setNotNilObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end
