//
//  MINISOTabbarInitVM.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/22.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOTabbarInitVM.h"
#import "UITabBar+MINISOBadge.h"
#import "UIImage+MINISOExtensions.h"

@implementation MINISOTabbarInitVM

CGFloat const MINISOTabBarItemImageHeight = 25.0;

- (MINISOTabBarController *)tabBarInitItemToKeyWindoForItemVC {
    [self tabBarItemModelInitForNative];
    
    BOOL isCenterState = NO;
    
    MINISOCustomNavigationVC *homeVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createHomeItemVCWithMode:NO]];
    MINISOCustomNavigationVC *shoppingVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createShoppingItemVCWithMode:NO]];
    MINISOCustomNavigationVC *ordersVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createOrdersItemVCWithMode:NO]];
    MINISOCustomNavigationVC *verbsVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createVerbItemVCWithMode:NO]];
    MINISOCustomNavigationVC *centerVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createCenterItemVCWithMode:isCenterState]];
    
    MINISOTabBarController *tabbarItemsVC = [[MINISOTabBarController alloc] init];
    tabbarItemsVC.viewControllers = @[homeVCNavigation, ordersVCNavigation, centerVCNavigation, verbsVCNavigation, shoppingVCNavigation];
    [tabbarItemsVC customTabBarSettingWithCenterItemState:isCenterState];
    
    //设置TabBarBadgeView的值
    [self addTabBarBadgeViewValueToTabBar:tabbarItemsVC];
    
    return tabbarItemsVC;
}

- (MINISOTabBarController *)tabBarInitItemToLayer1Role {
    [self tabBarItemModelInitForNative];
    
    BOOL isCenterState = NO;
    
    MINISOCustomNavigationVC *homeVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createHomeItemVCWithMode:NO]];
    MINISOCustomNavigationVC *ordersVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createOrdersItemVCWithMode:NO]];
    MINISOCustomNavigationVC *verbsVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createVerbItemVCWithMode:NO]];
    MINISOCustomNavigationVC *centerVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createCenterItemVCWithMode:isCenterState]];
    
    MINISOTabBarController *tabbarItemsVC = [[MINISOTabBarController alloc] init];
    tabbarItemsVC.viewControllers = @[homeVCNavigation, ordersVCNavigation, centerVCNavigation, verbsVCNavigation];
    [tabbarItemsVC customTabBarSettingWithCenterItemState:isCenterState];
    
    //设置TabBarBadgeView的值
    [self addTabBarBadgeViewValueToTabBar:tabbarItemsVC];
    
    return tabbarItemsVC;
}

- (MINISOTabBarController *)tabBarInitItemToLayer2Role {
    [self tabBarItemModelInitForNative];
    
    BOOL isCenterState = NO;
    
    MINISOCustomNavigationVC *homeVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createHomeItemVCWithMode:NO]];
    MINISOCustomNavigationVC *shoppingVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createShoppingItemVCWithMode:NO]];
    MINISOCustomNavigationVC *centerVCNavigation = [[MINISOCustomNavigationVC alloc] initWithRootViewController:[self createCenterItemVCWithMode:isCenterState]];
    
    MINISOTabBarController *tabbarItemsVC = [[MINISOTabBarController alloc] init];
    tabbarItemsVC.viewControllers = @[homeVCNavigation, centerVCNavigation, shoppingVCNavigation];
    [tabbarItemsVC customTabBarSettingWithCenterItemState:isCenterState];
    
    //设置TabBarBadgeView的值
    [self addTabBarBadgeViewValueToTabBar:tabbarItemsVC];
    
    return tabbarItemsVC;
}

//----奇数个item时方可设置isCenter为YES，其他情况均设置为NO
- (MINISOHomeItemViewController *)createHomeItemVCWithMode:(BOOL)isCenter {
    MINISOHomeItemViewController *homeVC = [[MINISOHomeItemViewController alloc] init];
    homeVC.view.backgroundColor = MINISOWhiteColor;
    homeVC.tabBarItem.title = self.homeItemModel.itemName;
    
    if (isCenter) {
        homeVC.tabBarItem.image = [UIImage imageWithColor:[UIColor whiteColor]];
        homeVC.tabBarItem.selectedImage = [UIImage imageWithColor:[UIColor whiteColor]];
    } else {
        homeVC.tabBarItem.image = [UIImage imageNamed:self.homeItemModel.itemDefaultIcon];
        homeVC.tabBarItem.selectedImage = [UIImage imageNamed:self.homeItemModel.itemSelectedIcon];
    }
    
    //设置标题和图片之间的间距
    homeVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0.0f, 0.0f);
    
    //设置图片的位置
    homeVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-(homeVC.tabBarItem.selectedImage.size.height - MINISOTabBarItemImageHeight) * 0.5, 0, (homeVC.tabBarItem.selectedImage.size.height - MINISOTabBarItemImageHeight) * 0.5, 0);
    
    return homeVC;
}

- (MINISOShoppingItemViewController *)createShoppingItemVCWithMode:(BOOL)isCenter {
    MINISOShoppingItemViewController *shoppingVC = [[MINISOShoppingItemViewController alloc] init];
    shoppingVC.view.backgroundColor = MINISOClearColor;
    shoppingVC.tabBarItem.title = self.shoppingItemModel.itemName;
    
    
    if (isCenter) {
        shoppingVC.tabBarItem.image = [UIImage imageWithColor:[UIColor whiteColor]];
        shoppingVC.tabBarItem.selectedImage = [UIImage imageWithColor:[UIColor whiteColor]];
    } else {
        shoppingVC.tabBarItem.image = [UIImage imageNamed:self.shoppingItemModel.itemDefaultIcon];
        shoppingVC.tabBarItem.selectedImage = [UIImage imageNamed:self.shoppingItemModel.itemSelectedIcon];
    }
    return shoppingVC;
}

- (MINISOOrdersItemViewController *)createOrdersItemVCWithMode:(BOOL)isCenter {
    MINISOOrdersItemViewController *ordersVC = [[MINISOOrdersItemViewController alloc] init];
    ordersVC.view.backgroundColor = MINISOGrayColor;
    ordersVC.tabBarItem.title = self.ordersItemModel.itemName;
    
    
    if (isCenter) {
        ordersVC.tabBarItem.image = [UIImage imageWithColor:[UIColor whiteColor]];
        ordersVC.tabBarItem.selectedImage = [UIImage imageWithColor:[UIColor whiteColor]];
    } else {
        ordersVC.tabBarItem.image = [UIImage imageNamed:self.ordersItemModel.itemDefaultIcon];
        ordersVC.tabBarItem.selectedImage = [UIImage imageNamed:self.ordersItemModel.itemSelectedIcon];
    }
    return ordersVC;
}

- (MINISOVerbItemViewController *)createVerbItemVCWithMode:(BOOL)isCenter {
    MINISOVerbItemViewController *verbsVC = [[MINISOVerbItemViewController alloc] init];
    verbsVC.view.backgroundColor = MINISOWhiteColor;
    verbsVC.tabBarItem.title = self.verbsItemModel.itemName;
    
    if (isCenter) {
        verbsVC.tabBarItem.image = [UIImage imageWithColor:[UIColor whiteColor]];
        verbsVC.tabBarItem.selectedImage = [UIImage imageWithColor:[UIColor whiteColor]];
    } else {
        verbsVC.tabBarItem.image = [UIImage imageNamed:self.verbsItemModel.itemDefaultIcon];
        verbsVC.tabBarItem.selectedImage = [UIImage imageNamed:self.verbsItemModel.itemSelectedIcon];
    }
    return verbsVC;
}

- (MINISOCenterItemViewController *)createCenterItemVCWithMode:(BOOL)isCenter {
    MINISOCenterItemViewController *centerVC = [[MINISOCenterItemViewController alloc] init];
    centerVC.view.backgroundColor = MINISOWhiteColor;
    centerVC.tabBarItem.title = self.centerItemModel.itemName;
    
    if (isCenter) {
        centerVC.tabBarItem.image = [UIImage imageWithColor:[UIColor whiteColor]];
        centerVC.tabBarItem.selectedImage = [UIImage imageWithColor:[UIColor whiteColor]];
    } else {
        centerVC.tabBarItem.image = [UIImage imageNamed:self.centerItemModel.itemDefaultIcon];
        centerVC.tabBarItem.selectedImage = [UIImage imageNamed:self.centerItemModel.itemSelectedIcon];
    }
    return centerVC;
}

//本地数据初始化item model
- (void)tabBarItemModelInitForNative {
    self.homeItemModel = [[MINISOTabbarItemModel alloc] init];
    self.homeItemModel.itemName = @"首页";
    self.homeItemModel.itemDefaultIcon = @"tabbarHomeIcon";
    self.homeItemModel.itemSelectedIcon = @"tabbarHomeSelectedIcon";
    self.homeItemModel.itemBadgeValue = @"0";
    self.homeItemModel.itemIndex = 0;
    
    self.ordersItemModel = [[MINISOTabbarItemModel alloc] init];
    self.ordersItemModel.itemName = @"接收验厂";
    self.ordersItemModel.itemDefaultIcon = @"tabbarOrdersIcon";
    self.ordersItemModel.itemSelectedIcon = @"tabbarOrdersSelectedIcon";
    self.ordersItemModel.itemBadgeValue = @"0";
    self.ordersItemModel.itemIndex = 1;
    
    self.centerItemModel = [[MINISOTabbarItemModel alloc] init];
    self.centerItemModel.itemName = @"签到";
    self.centerItemModel.itemDefaultIcon = @"tabbarCenterIcon";
    self.centerItemModel.itemSelectedIcon = @"tabbarCenterSelectedIcon";
    self.centerItemModel.itemBadgeValue = @"-1";
    self.centerItemModel.itemIndex = 2;
    
    self.verbsItemModel = [[MINISOTabbarItemModel alloc] init];
    self.verbsItemModel.itemName = @"扫码";
    self.verbsItemModel.itemDefaultIcon = @"tabbarVerbIcon";
    self.verbsItemModel.itemSelectedIcon = @"tabbarVerbSelectedIcon";
    self.verbsItemModel.itemBadgeValue = @"0";
    self.verbsItemModel.itemIndex = 3;
    
    self.shoppingItemModel = [[MINISOTabbarItemModel alloc] init];
    self.shoppingItemModel.itemName = @"验货流程";
    self.shoppingItemModel.itemDefaultIcon = @"tabbarShoppingIcon";
    self.shoppingItemModel.itemSelectedIcon = @"tabbarShoppingSelectedIcon";
    self.shoppingItemModel.itemBadgeValue = @"0";
    self.shoppingItemModel.itemIndex = 4;
    
}

//处理初始化的小红点
- (void)addTabBarBadgeViewValueToTabBar:(MINISOTabBarController *)currentTabBar {
    
    if ([self.homeItemModel.itemBadgeValue isKindOfClass:[NSString class]]) {
        if ([self.homeItemModel.itemBadgeValue integerValue] > 0) {
            [currentTabBar.tabBar updateBadge:self.homeItemModel.itemBadgeValue position:self.homeItemModel.itemIndex];
        } else if ([self.homeItemModel.itemBadgeValue integerValue] == -1) {
            [currentTabBar.tabBar displayTabBarRedPointForPosition:self.homeItemModel.itemIndex];
        }
    }
    
    if ([self.ordersItemModel.itemBadgeValue isKindOfClass:[NSString class]]) {
        if ([self.ordersItemModel.itemBadgeValue integerValue] > 0) {
            [currentTabBar.tabBar updateBadge:self.ordersItemModel.itemBadgeValue position:self.ordersItemModel.itemIndex];
        } else if ([self.ordersItemModel.itemBadgeValue integerValue] == -1) {
            [currentTabBar.tabBar displayTabBarRedPointForPosition:self.ordersItemModel.itemIndex];
        }
    }
    
    if ([self.shoppingItemModel.itemBadgeValue isKindOfClass:[NSString class]]) {
        if ([self.shoppingItemModel.itemBadgeValue integerValue] > 0) {
            [currentTabBar.tabBar updateBadge:self.shoppingItemModel.itemBadgeValue position:self.shoppingItemModel.itemIndex];
        } else if ([self.shoppingItemModel.itemBadgeValue integerValue] == -1) {
            [currentTabBar.tabBar displayTabBarRedPointForPosition:self.shoppingItemModel.itemIndex];
        }
    }
    
    if ([self.verbsItemModel.itemBadgeValue isKindOfClass:[NSString class]]) {
        if ([self.verbsItemModel.itemBadgeValue integerValue] > 0) {
            [currentTabBar.tabBar updateBadge:self.verbsItemModel.itemBadgeValue position:self.verbsItemModel.itemIndex];
        } else if ([self.verbsItemModel.itemBadgeValue integerValue] == -1) {
            [currentTabBar.tabBar displayTabBarRedPointForPosition:self.verbsItemModel.itemIndex];
        }
    }
    
    if ([self.centerItemModel.itemBadgeValue isKindOfClass:[NSString class]]) {
        if ([self.centerItemModel.itemBadgeValue integerValue] > 0) {
            [currentTabBar.tabBar updateBadge:self.centerItemModel.itemBadgeValue position:self.centerItemModel.itemIndex];
        } else if ([self.centerItemModel.itemBadgeValue integerValue] == -1)  {
            [currentTabBar.tabBar displayTabBarRedPointForPosition:self.centerItemModel.itemIndex];
        }
    }
}

@end
