//
//  MINISOShoppingItemViewController.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/21.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOShoppingItemViewController.h"
#import "MINISOAttachmentPreviewViewController.h"
#import "MINISOAttachmentTools.h"

@interface MINISOShoppingItemViewController ()

@end

@implementation MINISOShoppingItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MINISOWhiteColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 50, 100, 100);
    [btn addTarget:self action:@selector(testToolsObj) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = MINISORedColor;
    [self.view addSubview:btn];
}

- (void)reviewAttachment {
    MINISOAttachmentPreviewViewController *tempVC = [[MINISOAttachmentPreviewViewController alloc] init];
    tempVC.type = 1;
    tempVC.fileName = @"qms系统测试账号.txt";//@"https://www.tutorialspoint.com/ios/ios_tutorial.pdf";//@"SANGFOR_SSL自动构建参数单点登录配置指导_20130821.pdf";//@"新版iPhone尺寸.jpeg";//@"验厂报告详情缺少字段信息汇总.doc"; //@"qms系统测试账号.xlsx";
    tempVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tempVC animated:YES];
}

- (void)testToolsObj {
    MINISOAttachmentTools *toolsObj = [MINISOAttachmentTools new];
    [toolsObj persentPreviewVCWithType:2 fileUrl:@"https://www.tutorialspoint.com/ios/ios_tutorial.pdf" finishBlock:^(QLPreviewController * _Nonnull QLPVC) {
        if (QLPVC) {
            [self presentViewController:QLPVC animated:YES completion:nil];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
