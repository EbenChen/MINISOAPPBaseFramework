//
//  MINISOCenterItemViewController.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/21.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOCenterItemViewController.h"
#import "MINISO_Contact_View.h"
#import "MINISO_SignIn_Propmt_ViewController.h"
#import "AppDelegate.h"

@interface MINISOCenterItemViewController ()
{
    UIView *mapView;
    UIView *signInView;
    MINISO_Contact_View *contactView;
}
@end

@implementation MINISOCenterItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"签到";
    
    [self initView];
    
}

- (void)initView {
    
    mapView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, MAINSCREEN_WIDTH, 200)];
    [self.view addSubview:mapView];
    mapView.backgroundColor = [UIColor whiteColor];
    
    signInView = [[UIView alloc] initWithFrame:CGRectMake(0, mapView.bottom, MAINSCREEN_WIDTH, SCREEN_SAFE_HEIGHT - mapView.height)];
    [self.view addSubview:signInView];
    signInView.backgroundColor = RGBCOLOR(244 , 245, 246);
    
    contactView = [MINISO_Contact_View instanceView];
    [signInView addSubview:contactView];
    contactView.frame = CGRectMake(0, 0, MAINSCREEN_WIDTH, 80);
    
    UIButton *signInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    signInBtn.frame = CGRectMake((MAINSCREEN_WIDTH - 120) / 2, contactView.bottom + 40, 120, 120);
    [signInView addSubview:signInBtn];
    signInBtn.backgroundColor = RGBCOLOR(78 , 227, 199);
    [signInBtn addTarget:self action:@selector(signIn) forControlEvents:UIControlEventTouchUpInside];
    [signInBtn setTitle:@"签到" forState:UIControlStateNormal];
    signInBtn.layer.cornerRadius = signInBtn.width / 2;
    signInBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    
    UILabel *noteLab = [[UILabel alloc] initWithFrame:CGRectMake(0, signInBtn.bottom + 20, MAINSCREEN_WIDTH, 20)];
    [signInView addSubview:noteLab];
    noteLab.text = @"您已进入考勤范围：广东省广州市和业广场";
    noteLab.textColor = [UIColor darkGrayColor];
    noteLab.font = [UIFont systemFontOfSize:15];
    noteLab.textAlignment = NSTextAlignmentCenter;
}

- (void)signIn {
    
    MINISO_SignIn_Propmt_ViewController *vc = [MINISO_SignIn_Propmt_ViewController new];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;

    AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.window.rootViewController.definesPresentationContext = YES;

    [appdelegate.window.rootViewController presentViewController:vc  animated:NO completion:^{
        vc.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
