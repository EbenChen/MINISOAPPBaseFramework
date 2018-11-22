//
//  MINISOTabBarController.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/21.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOTabBarController.h"
#import "UITabBar+MINISOBadge.h"

@interface MINISOTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MINISOTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.translucent = NO;
    self.tabBar.backgroundColor = MINISOWhiteColor;
    
    self.delegate = self;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            obj.hidden = YES;
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    [tabBarController.tabBar clearTabBarItemRedPointForPosition:tabBarController.selectedIndex];
}

//custom method
- (void)customTabBarSettingWithCenterItemState:(BOOL)isCenter {
    //设置TabBarItem标题的字体颜色
    MINISOTabBarView *customTabBarView = [[MINISOTabBarView alloc] initWithFrame:self.tabBar.bounds];
    [customTabBarView tabBarViewSettingWithControllerAarrya:self.viewControllers centerItemState:isCenter];
    
    customTabBarView.tabBarDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:customTabBarView forKeyPath:@"tabBar"];
}

//MINISOTabBarViewDelegate
- (void)tabBarCenterItemBtnClick:(MINISOTabBarView *)tabBar {
    self.selectedIndex = 2;
}

@end
