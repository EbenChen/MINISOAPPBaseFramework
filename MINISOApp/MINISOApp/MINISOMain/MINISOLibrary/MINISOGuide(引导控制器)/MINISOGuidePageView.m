//
//  MINISOGuidePageView.m
//  MINISOApp
//
//  Created by Eben chen on 2018/7/16.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOGuidePageView.h"

@implementation MINISOGuidePageView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.guidePageScrollView.showsHorizontalScrollIndicator = NO;
    self.guidePageScrollView.bounces = NO;
    self.guidePageScrollView.pagingEnabled = YES;
    self.guidePageScrollView.delegate = self;
    
    self.guidePage.currentPage = 0;
    
    self.enterMainBtn.hidden = YES;

}

- (void)settingPageViewInformationWithArray:(NSArray *)imageArray pageSelectedColor:(UIColor *)selectedColor pageNormalColor:(UIColor *)normalColor {
    
    if ([imageArray count] <= 0) {
        return;
    }
    
    self.imageDataArray = imageArray;
    self.guidePageScrollView.contentSize = CGSizeMake(MAINSCREEN_WIDTH * imageArray.count, MAINSCREEN_HEIGHT);

    for (int i = 0; i < [imageArray count]; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * MAINSCREEN_WIDTH, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT)];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleToFill;
        [self.guidePageScrollView addSubview:imageView];
    }
    
    self.guidePage.numberOfPages = [imageArray count];
    self.guidePage.currentPageIndicatorTintColor = selectedColor;
    self.guidePage.pageIndicatorTintColor = normalColor;
}

- (void)setIsPageViewDisplay:(BOOL)isPageViewDisplay {
    self.guidePage.hidden = !isPageViewDisplay;
}

#pragma mark - scrollView Delegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    int currentIndex = (int)(scrollView.contentOffset.x + MAINSCREEN_WIDTH / 2) / MAINSCREEN_WIDTH;
    //如果是最后一页左滑
    if (currentIndex == self.imageDataArray.count - 1) {
        if ([self isScrolltoLeft:scrollView]) {
            if (self.isScrollerEnter) {
                [self theEndEnterMianContent];
            }
        }
    }
}

//修改page的显示
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView == self.guidePageScrollView) {
        int currentIndex = (int)(scrollView.contentOffset.x + MAINSCREEN_WIDTH / 2) / MAINSCREEN_WIDTH;
        self.guidePage.currentPage = currentIndex;
        if (currentIndex == [self.imageDataArray count] - 1) {
            self.enterMainBtn.hidden = !self.isEnterBtnDisplay;
        } else {
           self.enterMainBtn.hidden = YES;
        }
    }
}

#pragma mark - 判断滚动方向
-(BOOL )isScrolltoLeft:(UIScrollView *) scrollView{
    //返回YES为向左反动，NO为右滚动
    if ([scrollView.panGestureRecognizer translationInView:scrollView.superview].x < 0) {
        return YES;
    } else {
        return NO;
    }
}

- (void)theEndEnterMianContent {
    if (self.delegate && [self.delegate respondsToSelector:@selector(enterMainContentVC)]) {
        [self.delegate enterMainContentVC];
    }
}

- (IBAction)enternBtnClicked:(UIButton *)sender {
    [self theEndEnterMianContent];
}

@end
