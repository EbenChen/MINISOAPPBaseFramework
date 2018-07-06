//
//  MINISOBadgeView.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/26.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface MINISOBadgeView : UIView

@property (nonatomic, strong) IBInspectable UIColor *viewBGColor;
@property (nonatomic, strong) IBInspectable NSString *badgeValue;
@property (nonatomic, strong) IBInspectable UIColor *textColor;
@property (nonatomic, strong) IBInspectable UIFont *textFont;

@end
