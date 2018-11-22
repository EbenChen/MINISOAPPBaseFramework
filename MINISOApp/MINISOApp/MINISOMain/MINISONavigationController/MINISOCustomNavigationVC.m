//
//  MINISOCustomNavigationVC.m
//  MINISOApp
//
//  Created by Eben chen on 2018/7/10.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOCustomNavigationVC.h"

@interface MINISOCustomNavigationVC ()

@end

@implementation MINISOCustomNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //重写了leftbarItem之后,需要添加如下方法才能重新启用右滑返回
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }

}

+ (void)initialize {
    //appearance方法返回一个导航栏的外观对象
    //修改了这个外观对象，相当于修改了整个项目中的外观
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    //设置导航栏背景颜色
    [navigationBar setBarTintColor:MINISONavigationBgColor];
    //设置NavigationBarItem文字的颜色
    [navigationBar setTintColor:MINISONavigationTintColor];
    //设置标题栏颜色
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:MINISONavigationTitleColor,NSFontAttributeName : [UIFont systemFontOfSize:18]};
    
    /*
     //设置导航栏文字的主题
     NSShadow *shadow = [[NSShadow alloc]init];
     [shadow setShadowOffset:CGSizeZero];
     [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSShadowAttributeName : shadow}];
     [navigationBar setBackgroundImage:[UIImage imageNamed:@"ic_cell_bg_selected"] forBarMetrics:UIBarMetricsDefault];
     //修改所有UIBarButtonItem的外观
     UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
     
     // 修改item的背景图片
     //[barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
     //[barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
     //修改item上面的文字样式
     NSDictionary *dict =@{NSForegroundColorAttributeName : [UIColor whiteColor],NSShadowAttributeName : shadow};
     [barButtonItem setTitleTextAttributes:dict forState:UIControlStateNormal];
     [barButtonItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
     //修改返回按钮样式
     [barButtonItem setBackButtonBackgroundImage:[UIImage imageNamed:NAVIGATION_BAR_BACK_ICON_NAME] forState:UIControlStateNormal barMetrics:UIBarMetricsCompact];
     //设置状态栏样式
     [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
     */
}

//重写push后返回按钮的文字,文字可以为空字符串.
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //修改返回文字
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    //全部修改返回按钮,但是会失去右滑返回的手势
    if (viewController.navigationItem.leftBarButtonItem == nil && self.viewControllers.count >= 1) {
        
        viewController.navigationItem.leftBarButtonItem = [self creatBackButton];
    }
    
    [super pushViewController:viewController animated:animated];
}


- (UIBarButtonItem *)creatBackButton {
    return [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"leftItemBackWhite"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
}

- (void)popSelf {
    
    [self navigationTransparentState:NO];
    
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
