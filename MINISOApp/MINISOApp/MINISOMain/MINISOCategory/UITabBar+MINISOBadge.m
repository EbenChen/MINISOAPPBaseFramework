//
//  UITabBar+MINISOBadge.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/26.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "UITabBar+MINISOBadge.h"
#import "MINISOBadgeView.h"
#import <objc/runtime.h>

//由于索引由0开始，直接用索引做为badgeview ID会与空的tag ID冲突所以添加默认增量来处理
#define INDEXINCREMENT 1

@interface UITabBar ()

@property (nonatomic, strong) NSMutableDictionary *badgeDict;

@end


@implementation UITabBar (MINISOBadge)

- (NSMutableDictionary *)badgeDict {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, _cmd);
    if (!dict) {
        dict = [NSMutableDictionary dictionaryWithCapacity:0];
        objc_setAssociatedObject(self, _cmd, dict, OBJC_ASSOCIATION_RETAIN);
    }
    
    return dict;
}

- (MINISOBadgeView *)badgeViewAtIndex:(NSInteger)index {
    MINISOBadgeView *badgeView =  [self.badgeDict objectForKey:@(index)];
    if (!badgeView && self.items.count > 0) {
        badgeView = [[MINISOBadgeView alloc] init];
        badgeView.tag = index + INDEXINCREMENT;
        
        [badgeView sizeToFit];
        
        float tabItemWidth = self.bounds.size.width / self.items.count;
        
        CGRect frame = badgeView.frame;
        frame.origin = CGPointMake(tabItemWidth * index + tabItemWidth / 2 + 10, 1);
        badgeView.frame = frame;
        
        [self addSubview:badgeView];
        
        [self.badgeDict setObject:badgeView forKey:@(index)];
    }
    
    return badgeView;
}

- (UIView *)redPointViewAtIndex:(NSInteger)index {
    UIView *badgeView =  [self.badgeDict objectForKey:@(index)];
    if (!badgeView && self.items.count > 0) {
        badgeView = [[UIView alloc] init];
        badgeView.tag = index + INDEXINCREMENT;
        
        float tabItemWidth = self.bounds.size.width / self.items.count;
        
        CGFloat viewFrameSize = 6.0f;
        
        CGRect frame = badgeView.frame;
        frame.origin = CGPointMake(tabItemWidth * index + tabItemWidth / 2 + viewFrameSize, 2);
        frame.size = CGSizeMake(viewFrameSize, viewFrameSize);
        badgeView.frame = frame;
        
        badgeView.backgroundColor = [UIColor redColor];
        badgeView.layer.cornerRadius = viewFrameSize / 2;
        //确保可以有圆角
        badgeView.layer.masksToBounds = YES;
        
        [self addSubview:badgeView];
        
        [self.badgeDict setObject:badgeView forKey:@(index)];
    }
    
    return badgeView;
}

- (void)updateBadge:(NSString *)badgeValue bgColor:(UIColor *)bgColor position:(NSInteger)index {
    if (index >= 0 && index < self.items.count) {
        MINISOBadgeView *badgeView = [self badgeViewAtIndex:index];
        
        if (badgeView) {
            badgeView.viewBGColor = bgColor;
            badgeView.badgeValue = badgeValue;
        }
    }
}

- (void)updateBadge:(NSString *)badgeValue position:(NSInteger)index {
    if (index >= 0 && index < self.items.count) {
        MINISOBadgeView *badgeView = [self badgeViewAtIndex:index];
        
        if (badgeView) {
            badgeView.badgeValue = badgeValue;
        }
    }
}

- (void)updateBadgeTextColor:(UIColor *)textColor position:(NSInteger)index {
    if (index >= 0 && index < self.items.count) {
        MINISOBadgeView *badgeView = [self badgeViewAtIndex:index];
        
        if (badgeView) {
            badgeView.textColor = textColor;
        }
    }
}

- (void)updateBadgeBgColor:(UIColor *)bgColor position:(NSInteger)index {
    if (index >= 0 && index < self.items.count) {
        MINISOBadgeView *badgeView = [self badgeViewAtIndex:index];
        
        if (badgeView) {
            badgeView.viewBGColor = bgColor;
        }
    }
}

- (void)updateBadgeTextFont:(UIFont *)textFont position:(NSInteger)index {
    if (index >= 0 && index < self.items.count) {
        MINISOBadgeView *badgeView = [self badgeViewAtIndex:index];
        
        if (badgeView) {
            badgeView.textFont = textFont;
        }
    }
}

- (void)displayTabBarRedPointForPosition:(NSInteger)index {
    if (index >= 0 && index < self.items.count) {
        [self redPointViewAtIndex:index];
    }
}

- (void)clearTabBarItemRedPointForPosition:(NSInteger)index {
    if (index >= 0 && index < [self.subviews count]) {
        for (UIView *badgeView in self.subviews) {
            if (badgeView.tag == index + INDEXINCREMENT) {
                [badgeView removeFromSuperview];
            }
        }
    }
}

@end
