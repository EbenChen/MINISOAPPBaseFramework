//
//  MINISOTabBarView.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/22.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MINISOTabBarView;

@protocol MINISOTabBarViewDelegate <NSObject>

@optional
- (void)tabBarCenterItemBtnClick:(MINISOTabBarView *)tabBar;

@end

@interface MINISOTabBarView : UITabBar

@property (nonatomic, strong) UIButton *itemCenterBtn; //中间按钮
@property (nonatomic, weak) id<MINISOTabBarViewDelegate> tabBarDelegate ;

//对tabBar处理对象
- (void)tabBarViewSettingWithControllerAarrya:(NSArray *)controllerArrays;
//设置Controller的badgeValue和badgeview
- (void)tabBarViewBadgeViewSettingWithController:(UINavigationController *)controller badgeValue:(NSString *)value;

@end
