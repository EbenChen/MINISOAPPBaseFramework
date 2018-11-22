//
//  MINISOTabBarController.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/21.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MINISOTabBarView.h"

@interface MINISOTabBarController : UITabBarController<MINISOTabBarViewDelegate>

//设置TabBarView
- (void)customTabBarSettingWithCenterItemState:(BOOL)isCenter;

@end
