//
//  UINavigationItem+MINISOExtensions.h
//  MINISOApp
//
//  Created by Eben chen on 2018/7/10.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (MINISOExtensions)

//设置标题
- (void)navigationItemAddTitle:(NSString *)title;

//添加leftitem默认button
- (void)leftBarAddDefaultBtn:(id)viewController actionMethod:(SEL)actionMethod;
//添加leftitem自定义button
- (void)leftBarAddCustomBtnWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;

//添加rightitem默认button
- (void)rightBarAddDefaultBtn:(id)viewController actionMethod:(SEL)actionMethod;
//添加rightitem自定义button
- (void)rightBarAddCustomBtnWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;

@end
