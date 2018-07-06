//
//  MINISOTabBarView.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/22.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOTabBarView.h"

@implementation MINISOTabBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)tabBarViewSettingWithControllerAarrya:(NSArray *)controllerArrays {
    
    NSDictionary *titleDefaultAttributDict = @{NSForegroundColorAttributeName:MINISOTabBarTitleDefaultColor, NSFontAttributeName:[UIFont systemFontOfSize:12.0f]};
    NSDictionary *titleAttributesDict = @{NSForegroundColorAttributeName:MINISOTabBarTitleSelectedColor, NSFontAttributeName:[UIFont systemFontOfSize:12.0f]};
    
    for (UINavigationController *itemObject in controllerArrays) {
        //默认字体颜色和大小
        [itemObject.tabBarItem setTitleTextAttributes:titleDefaultAttributDict forState:UIControlStateNormal];
        //选中字体颜色和大小
        [itemObject.tabBarItem setTitleTextAttributes:titleAttributesDict forState:UIControlStateSelected];
    }
}

- (void)tabBarViewBadgeViewSettingWithController:(UINavigationController *)controller badgeValue:(NSString *)value{
    
}

@end
