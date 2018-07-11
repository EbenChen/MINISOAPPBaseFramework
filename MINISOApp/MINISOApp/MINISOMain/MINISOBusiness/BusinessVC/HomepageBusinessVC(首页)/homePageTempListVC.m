//
//  homePageTempListVC.m
//  MINISOApp
//
//  Created by Eben chen on 2018/7/10.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "homePageTempListVC.h"
#import "MBProgressHUD+MINISOExtensions.h"
#import "UINavigationItem+MINISOExtensions.h"

@interface homePageTempListVC ()

@end

@implementation homePageTempListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self.navigationItem navigationItemAddTitle:@"列表页面!!!!"];
    [self.navigationItem rightBarAddDefaultBtn:self actionMethod:@selector(navigationRightItemClicked)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationRightItemClicked {
    [MBProgressHUD showMessage:@"你点击了导航栏的右边按钮" toView:self.view];
}

@end
