//
//  NSDate+MINISOExtensions.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/27.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "NSDate+MINISOExtensions.h"

@implementation NSDate (MINISOExtensions)

- (NSString *)appTimeInterval{
    return [NSString stringWithFormat:@"%ld", (long)[self timeIntervalSince1970]];;
}

@end
