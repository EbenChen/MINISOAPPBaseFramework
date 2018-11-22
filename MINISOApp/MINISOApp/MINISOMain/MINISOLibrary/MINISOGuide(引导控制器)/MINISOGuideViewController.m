//
//  MINISOGuideViewController.m
//  MINISOQAS
//
//  Created by Eben chen on 2018/7/11.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOGuideViewController.h"
#import "MINISOGuidePageView.h"

@interface MINISOGuideViewController ()<MINISOGuidePageViewDelegate>

@end

@implementation MINISOGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createGuideViewContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//创建引导页面数据
- (void)createGuideViewContentView {
    
    NSInteger maxImageCount = 4;
    
    NSMutableArray *imageNameArray = [NSMutableArray arrayWithCapacity:maxImageCount];
    for (int i = 0; i < maxImageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"guide%@_%d.jpg",[self imageSizeName], i + 1];
        [imageNameArray addObject:imageName];
    }
    
    MINISOGuidePageView *guideImageView = [[NSBundle mainBundle] loadNibNamed:@"MINISOGuidePageView" owner:nil options:nil][0];
    
    guideImageView.frame = self.view.bounds;
    guideImageView.delegate = self;
    guideImageView.isScrollerEnter = YES;
    guideImageView.isEnterBtnDisplay = NO;
    guideImageView.isPageViewDisplay = YES;
    [self.view addSubview:guideImageView];
    
    [guideImageView settingPageViewInformationWithArray:[imageNameArray copy] pageSelectedColor:MINISORedColor pageNormalColor:RGBSAMECOLOR(229)];
}

//根据尺寸生成image名称
- (NSString *)imageSizeName {
#warning 没有图紧做测试，后续正式环境要删除
    return @"_640";
    
    if (IS_IPHONE5) {
        return @"_640";
    } else if(IS_PHONE6Plus) {
        return @"_1242";
    } else if (IS_IPhoneX){
        return @"_1125";
    } else {
        //IS_PHONE6
        return @"_750";
    }
}

#pragma mark --MINISOGuidePageViewDelegate
- (void)enterMainContentVC {
    if (self.callBack) {
        self.callBack();
    }
}

@end
