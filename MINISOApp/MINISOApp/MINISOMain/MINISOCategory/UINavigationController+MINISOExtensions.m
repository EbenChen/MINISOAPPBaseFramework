//
//  UINavigationController+MINISOExtentsions.m
//  MINISOApp
//
//  Created by Eben chen on 2018/7/10.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "UINavigationController+MINISOExtensions.h"

@implementation UINavigationController (MINISOExtensions)

- (void)navigationTransparentState:(BOOL)state {
    if (state) {
        //设置透明
        //设置导航栏背景图片为一个空的image，这样就透明了
        [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        //去掉透明后导航栏下边的黑边
        [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    } else {
        //设置不透明
        //如果不想让其他页面的导航栏变为透明 需要重置
        [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setShadowImage:nil];
    }
}



@end
