//
//  UITabBar+MINISOBadge.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/26.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (MINISOBadge)

// 更新badge和bgColor
- (void)updateBadge:(NSString *)badgeValue bgColor:(UIColor *)bgColor position:(NSInteger)index;

// 更新badge
- (void)updateBadge:(NSString *)badgeValue position:(NSInteger)index;

// 更新文本颜色
- (void)updateBadgeTextColor:(UIColor *)textColor position:(NSInteger)index;

// 更新背景色
- (void)updateBadgeBgColor:(UIColor *)bgColor position:(NSInteger)index;

// 更新文本字体
- (void)updateBadgeTextFont:(UIFont *)textFont position:(NSInteger)index;

//仅显示小红点
- (void)displayTabBarRedPointForPosition:(NSInteger)index;

//清除小红点
- (void)clearTabBarItemRedPointForPosition:(NSInteger)index;

@end
