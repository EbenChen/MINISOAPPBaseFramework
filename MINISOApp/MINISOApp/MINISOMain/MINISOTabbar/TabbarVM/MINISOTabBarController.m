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
    
    [self addTopPartingLineView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            obj.hidden = YES;
        }
    }];
}

//添加顶部分割线
- (void)addTopPartingLineView {
    UIImageView *partingView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tabBar.frame.size.width, 0.5f)];
    partingView.backgroundColor = RGBSAMECOLOR(225);
    [self.tabBar addSubview:partingView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    [tabBarController.tabBar clearTabBarItemRedPointForPosition:tabBarController.selectedIndex];
}

@end
