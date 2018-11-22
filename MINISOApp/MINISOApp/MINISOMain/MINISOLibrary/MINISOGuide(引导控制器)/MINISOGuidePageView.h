//
//  MINISOGuidePageView.h
//  MINISOApp
//
//  Created by Eben chen on 2018/7/16.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MINISOGuidePageViewDelegate <NSObject>

- (void)enterMainContentVC;

@end

@interface MINISOGuidePageView : UIView<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *guidePageScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *guidePage;
@property (weak, nonatomic) IBOutlet UIButton *enterMainBtn;

@property (weak, nonatomic) id <MINISOGuidePageViewDelegate>delegate;
@property (nonatomic, strong) NSArray *imageDataArray;
@property (nonatomic, assign) BOOL isScrollerEnter; //滑动进入主界面
@property (nonatomic, assign) BOOL isPageViewDisplay;//是否显示分页
@property (nonatomic, assign) BOOL isEnterBtnDisplay;//是否显示进入按钮

- (void)settingPageViewInformationWithArray:(NSArray *)imageArray pageSelectedColor:(UIColor *)selectedColor pageNormalColor:(UIColor *)normalColor;

@end
