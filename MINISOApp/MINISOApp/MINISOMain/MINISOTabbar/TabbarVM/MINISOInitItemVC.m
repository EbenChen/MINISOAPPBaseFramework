//
//  MINISOInitItemVC.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/21.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOInitItemVC.h"
#import "MINISOTabbarItemModel.h"
#import "MINISOHomeItemViewController.h"
#import "MINISOShoppingItemViewController.h"
#import "MINISOOrdersItemViewController.h"
#import "MINISOVerbItemViewController.h"
#import "MINISOCenterItemViewController.h"

@interface MINISOInitItemVC ()

@property (nonatomic, strong) MINISOTabbarItemModel *homeItemModel;
@property (nonatomic, strong) MINISOTabbarItemModel *ordersItemModel;
@property (nonatomic, strong) MINISOTabbarItemModel *shoppingItemModel;
@property (nonatomic, strong) MINISOTabbarItemModel *verbsItemModel;
@property (nonatomic, strong) MINISOTabbarItemModel *centerItemModel;

@end

@implementation MINISOInitItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MINISOTabBarController *)tabBarInitItemToKeyWindoForItemVC {
    [self tabBarItemModelInitForNative];
    
    MINISOHomeItemViewController *homeVC = [[MINISOHomeItemViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor redColor];
    homeVC.tabBarItem.title = self.homeItemModel.itemName;
    homeVC.tabBarItem.image = [UIImage imageNamed:self.homeItemModel.itemDefaultIcon];
    homeVC.tabBarItem.selectedImage = [UIImage imageNamed:self.homeItemModel.itemSelectedIcon];
    homeVC.tabBarItem.badgeValue = self.homeItemModel.itemBadgeValue;
    
    MINISOShoppingItemViewController *shoppingVC = [[MINISOShoppingItemViewController alloc] init];
    shoppingVC.view.backgroundColor = [UIColor whiteColor];
    shoppingVC.tabBarItem.title = self.shoppingItemModel.itemName;
    shoppingVC.tabBarItem.image = [UIImage imageNamed:self.shoppingItemModel.itemDefaultIcon];
    shoppingVC.tabBarItem.selectedImage = [UIImage imageNamed:self.shoppingItemModel.itemSelectedIcon];
    shoppingVC.tabBarItem.badgeValue = self.shoppingItemModel.itemBadgeValue;
    
    MINISOOrdersItemViewController *ordersVC = [[MINISOOrdersItemViewController alloc] init];
    ordersVC.view.backgroundColor = [UIColor yellowColor];
    ordersVC.tabBarItem.title = self.ordersItemModel.itemName;
    ordersVC.tabBarItem.image = [UIImage imageNamed:self.ordersItemModel.itemDefaultIcon];
    ordersVC.tabBarItem.selectedImage = [UIImage imageNamed:self.ordersItemModel.itemSelectedIcon];
    ordersVC.tabBarItem.badgeValue = self.ordersItemModel.itemBadgeValue;
    
    MINISOVerbItemViewController *verbsVC = [[MINISOVerbItemViewController alloc] init];
    verbsVC.view.backgroundColor = [UIColor blueColor];
    verbsVC.tabBarItem.title = self.verbsItemModel.itemName;
    verbsVC.tabBarItem.image = [UIImage imageNamed:self.verbsItemModel.itemDefaultIcon];
    verbsVC.tabBarItem.selectedImage = [UIImage imageNamed:self.verbsItemModel.itemSelectedIcon];
    verbsVC.tabBarItem.badgeValue = self.verbsItemModel.itemBadgeValue;
    
    MINISOCenterItemViewController *centerVC = [[MINISOCenterItemViewController alloc] init];
    centerVC.view.backgroundColor = [UIColor purpleColor];
    centerVC.tabBarItem.title = self.centerItemModel.itemName;
    centerVC.tabBarItem.image = [UIImage imageNamed:self.centerItemModel.itemDefaultIcon];
    centerVC.tabBarItem.selectedImage = [UIImage imageNamed:self.centerItemModel.itemSelectedIcon];
    centerVC.tabBarItem.badgeValue = self.centerItemModel.itemBadgeValue;
    
    UINavigationController *homeVCNavigation = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UINavigationController *shoppingVCNavigation = [[UINavigationController alloc] initWithRootViewController:shoppingVC];
    UINavigationController *ordersVCNavigation = [[UINavigationController alloc] initWithRootViewController:ordersVC];
    UINavigationController *verbsVCNavigation = [[UINavigationController alloc] initWithRootViewController:verbsVC];
    UINavigationController *centerVCNavigation = [[UINavigationController alloc] initWithRootViewController:centerVC];
    
    MINISOTabBarController *tabbarItemsVC = [[MINISOTabBarController alloc] init];
    tabbarItemsVC.viewControllers = @[homeVCNavigation, shoppingVCNavigation, ordersVCNavigation, verbsVCNavigation, centerVCNavigation];
    
    return tabbarItemsVC;
}

//本地数据初始化item model
- (void)tabBarItemModelInitForNative {
    self.homeItemModel = [[MINISOTabbarItemModel alloc] init];
    self.homeItemModel.itemName = @"首页";
    self.homeItemModel.itemDefaultIcon = @"tabbarHomeIcon";
    self.homeItemModel.itemSelectedIcon = @"tabbarHomeSelectedIcon";
    
    self.ordersItemModel = [[MINISOTabbarItemModel alloc] init];
    self.ordersItemModel.itemName = @"订单";
    self.ordersItemModel.itemDefaultIcon = @"tabbarOrdersIcon";
    self.ordersItemModel.itemSelectedIcon = @"tabbarOrdersSelectedIcon";

    
    self.shoppingItemModel = [[MINISOTabbarItemModel alloc] init];
    self.shoppingItemModel.itemName = @"选购";
    self.shoppingItemModel.itemDefaultIcon = @"tabbarShoppingIcon";
    self.shoppingItemModel.itemSelectedIcon = @"tabbarShoppingSelectedIcon";

    
    self.verbsItemModel = [[MINISOTabbarItemModel alloc] init];
    self.verbsItemModel.itemName = @"验货";
    self.verbsItemModel.itemDefaultIcon = @"tabbarVerbIcon";
    self.verbsItemModel.itemSelectedIcon = @"tabbarVerbSelectedIcon";

    
    self.centerItemModel = [[MINISOTabbarItemModel alloc] init];
    self.centerItemModel.itemName = @"个人";
    self.centerItemModel.itemDefaultIcon = @"tabbarCenterIcon";
    self.centerItemModel.itemSelectedIcon = @"tabbarCenterSelectedIcon";

}

@end
