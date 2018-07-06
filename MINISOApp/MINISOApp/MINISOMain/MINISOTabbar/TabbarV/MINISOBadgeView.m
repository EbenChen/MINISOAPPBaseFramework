//
//  MINISOBadgeView.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/26.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOBadgeView.h"

@interface MINISOBadgeView ()
{
    UILabel *_valueLabel;
}
@end

@implementation MINISOBadgeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit {
    self.clipsToBounds = YES;
    self.viewBGColor = [UIColor redColor];
    self.userInteractionEnabled = NO;
    
    _valueLabel = [[UILabel alloc] init];
    
    _valueLabel.textColor = [UIColor whiteColor];
    _valueLabel.font = [UIFont systemFontOfSize:12];
    _valueLabel.text = self.badgeValue;
    
    [self addSubview:_valueLabel];
}

- (void)setViewBGColor:(UIColor *)viewBGColor {
    _viewBGColor = viewBGColor;
    
    self.backgroundColor = viewBGColor;
    [self setNeedsLayout];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    
    _valueLabel.textColor = textColor;
    [self setNeedsLayout];
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    
    _valueLabel.text = badgeValue;
    [self setNeedsLayout];
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    
    _valueLabel.font = textFont;
    [self setNeedsLayout];
}

- (void)sizeToFit {
    [super sizeToFit];
    
    CGRect frame = self.frame;
    frame.size = [self size];
    self.frame = frame;
}

- (CGSize)size {
    [_valueLabel sizeToFit];
    
    CGSize size = [@"#" sizeWithAttributes:@{NSFontAttributeName: _valueLabel.font}];
    
    float width = _valueLabel.bounds.size.width + size.width * 1.5;
    float height = _valueLabel.bounds.size.height + 2;
    
    if (width < height) {
        width = height;
    }
    
    return CGSizeMake(width, height);
}

- (CGSize)intrinsicContentSize {
    
    return [self size];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_valueLabel sizeToFit];
    
    [self sizeToFit];
    
    _valueLabel.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    self.layer.cornerRadius = self.bounds.size.width < self.bounds.size.height ? self.bounds.size.width / 2 : self.bounds.size.height / 2;
}

@end
