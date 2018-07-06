//
//  MINISOTabBarView.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/22.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MINISOTabBarView : UITabBar

//对tabBar处理对象
- (void)tabBarViewSettingWithControllerAarrya:(NSArray *)controllerArrays;
//设置Controller的badgeValue和badgeview
- (void)tabBarViewBadgeViewSettingWithController:(UINavigationController *)controller badgeValue:(NSString *)value;

@end
