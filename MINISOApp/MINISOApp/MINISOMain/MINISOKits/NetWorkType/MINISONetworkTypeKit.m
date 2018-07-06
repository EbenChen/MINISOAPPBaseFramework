//
//  MINISONetworkTypeKit.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISONetworkTypeKit.h"
#import "AFNetworkReachabilityManager.h"

@implementation MINISONetworkTypeKit

+ (NSString *)networkType {
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    NSString *strNetworkType = @"0";
    
    strNetworkType = [[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString];
    
    return strNetworkType;
}

@end
