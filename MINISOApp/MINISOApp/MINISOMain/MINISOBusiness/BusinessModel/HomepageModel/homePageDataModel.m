//
//  homePageDataModel.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "homePageDataModel.h"

@implementation homePageDataModel

//在模型内部实现+ (NSDictionary *)objectClassInArray方法
+ (NSDictionary *)objectClassInArray {
    return @{
             
             @"tlq" : [MINISOTLQListModel class],
             @"mmq" : [MINISOMMQListModel class],
             
             };
}

+ (Class)objectClassInArray:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"tlq"]) {
        return [MINISOTLQListModel class];
    }
    
    if ([propertyName isEqualToString:@"mmq"]) {
        return [MINISOMMQListModel class];
    }
    return nil;
}

@end
