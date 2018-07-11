//
//  UINavigationItem+MINISOExtensions.m
//  MINISOApp
//
//  Created by Eben chen on 2018/7/10.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "UINavigationItem+MINISOExtensions.h"

@implementation UINavigationItem (MINISOExtensions)

- (UIButton *) createNavtgationItemButton:(CGRect)frame normalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage title:(NSString *)title viewController:(id)viewController action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:viewController action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


- (void)navigationItemAddTitle:(NSString *)title {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,200, 36)];
    titleLabel.backgroundColor = MINISOClearColor;
    titleLabel.textColor = MINISONavigationTitleColor;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    
    self.titleView = titleLabel;
}

- (void)leftBarAddDefaultBtn:(id)viewController actionMethod:(SEL)actionMethod {
    
    UIImage *backImage = [UIImage imageNamed:@"leftItemBackWhite"];
    
    UIButton *bgButton = [self createNavtgationItemButton:CGRectMake(0, 0, 44, 44) normalImage:nil highlightImage:nil title:nil viewController:viewController action:actionMethod];
    
    UIButton *backButton = [self createNavtgationItemButton:CGRectMake(-5, 10.5, 23, 23) normalImage:backImage highlightImage:backImage title:nil viewController:viewController action:actionMethod];
    [bgButton addSubview:backButton];
    
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:bgButton];
    self.leftBarButtonItem = leftButtonItem;
}

- (void)leftBarAddCustomBtnWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action {
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 37, 37)];
    [rightButton setImage:image forState:UIControlStateNormal];
    [rightButton setTitle:title forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [rightButton setTitleColor:color forState:UIControlStateNormal];
    rightButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.leftBarButtonItem = rightItem;
}

- (void)rightBarAddDefaultBtn:(id)viewController actionMethod:(SEL)actionMethod {
    UIButton *bgButton = [self createNavtgationItemButton:CGRectMake(0, 0, 44, 44) normalImage:nil highlightImage:nil title:nil viewController:viewController action:actionMethod];
    UIImage *itemImage = [UIImage imageNamed:@"rightItemDefaultImage"];
    UIButton *rightButton = [self createNavtgationItemButton:CGRectMake(17, 10.5, 25, 23) normalImage:itemImage highlightImage:itemImage title:nil viewController:viewController action:actionMethod];
    [bgButton addSubview:rightButton];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:bgButton];
    self.rightBarButtonItem = rightItem;
}

- (void)rightBarAddCustomBtnWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action {
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 37, 37)];
    [rightButton setImage:image forState:UIControlStateNormal];
    [rightButton setTitle:title forState:UIControlStateNormal];
    rightButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.rightBarButtonItem = rightItem;
}

@end
