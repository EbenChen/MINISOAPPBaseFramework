//
//  MINISOMMQListModel.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOMMQListModel.h"

@implementation MINISOMMQListModel

//在模型内部实现+ (NSDictionary *)objectClassInArray方法
+ (NSDictionary *)objectClassInArray {
    return @{ @"list" : [MINISOTLQListModel class], };
}

+ (Class)objectClassInArray:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"list"]) {
        return [MINISOTLQListModel class];
    }
    return nil;
}

@end
