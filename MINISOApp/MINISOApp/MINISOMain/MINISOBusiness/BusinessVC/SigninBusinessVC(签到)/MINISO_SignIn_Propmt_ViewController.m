//
//  MINISO_SignIn_Propmt_ViewController.m
//  MINISOApp
//
//  Created by LJ on 2018/7/9.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISO_SignIn_Propmt_ViewController.h"

@interface MINISO_SignIn_Propmt_ViewController ()

@end

@implementation MINISO_SignIn_Propmt_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.tag = 100;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if (touch.view.tag == 100) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
