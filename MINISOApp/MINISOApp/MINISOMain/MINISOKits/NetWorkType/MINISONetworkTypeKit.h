//
//  MINISONetworkTypeKit.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MINISONetworkTypeKit : NSObject

/**
 网络类型
 
 @return wifi、4G、3G、2G、0（0表示不可访问）
 */
+ (NSString *)networkType;

@end
