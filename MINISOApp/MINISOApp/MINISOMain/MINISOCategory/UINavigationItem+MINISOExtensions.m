//
//  UINavigationItem+MINISOExtensions.m
//  MINISOApp
//
//  Created by Eben chen on 2018/7/10.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "UINavigationItem+MINISOExtensions.h"

@implementation UINavigationItem (MINISOExtensions)

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

@end
