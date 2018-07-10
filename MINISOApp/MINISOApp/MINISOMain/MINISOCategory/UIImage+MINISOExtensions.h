//
//  UIImage+MINISOExtensions.h
//  MINISOApp
//
//  Created by Eben chen on 2018/7/6.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MINISOExtensions)

/**
 *  根据颜色生成一张图片
 *  @param color 提供的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
