//
//  MINISOHomepageBannerView.h
//  MINISOApp
//
//  Created by Eben chen on 2018/7/9.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MINISOHomepageBannerViewDelegate <NSObject>

@optional
- (void)InformationItemClicked;

@end

@interface MINISOHomepageBannerView : UIView

@property (weak, nonatomic) id <MINISOHomepageBannerViewDelegate>delegate;

@end
