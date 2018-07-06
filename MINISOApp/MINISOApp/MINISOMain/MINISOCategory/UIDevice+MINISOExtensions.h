//
//  UIDevice+MINISOExtensions.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (MINISOExtensions)

+ (NSString *)deviceName;

/// 磁盘剩余空间（单位：b）
+ (NSUInteger)freeDiskSpace;

@end
