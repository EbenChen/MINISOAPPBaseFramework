//
//  MINISOTabBarView.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/22.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOTabBarView.h"
#import "UIImage+MINISOExtentsions.h"
#import "UIView+MINISOExtentsions.h"

#define TabBarItemMagin 10

@implementation MINISOTabBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addCenterItemBtn];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)addCenterItemBtn {
    self.backgroundColor = MINISOWhiteColor;
    [self setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    
    self.itemCenterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //  设定button大小为适应图片
    UIImage *normalImage = [UIImage imageNamed:@"tabbarCenterItemIcon"];
    self.itemCenterBtn.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    [self.itemCenterBtn setImage:normalImage forState:UIControlStateNormal];
    //去除选择时高亮
    self.itemCenterBtn.adjustsImageWhenHighlighted = NO;
    [self.itemCenterBtn addTarget:self action:@selector(tabBarCenterItemBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //根据图片调整button的位置(图片中心在tabbar的中间最上部，这个时候由于按钮是有一部分超出tabbar的，所以点击无效，要进行处理)
    self.itemCenterBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - normalImage.size.width)/2.0, - normalImage.size.height * 0.35, normalImage.size.width, normalImage.size.height);
    [self addSubview:self.itemCenterBtn];
    [self bringSubviewToFront:self.itemCenterBtn];
}

//点击凸出按钮部分
- (void)tabBarCenterItemBtnClick {
    //如果tabbar的代理实现了对应的代理方法，那么就调用代理的该方法
    if ([self.delegate respondsToSelector:@selector(tabBarCenterItemBtnClick:)]) {
        [self.tabBarDelegate tabBarCenterItemBtnClick:self];
    }
}

//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.itemCenterBtn];
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.itemCenterBtn pointInside:newP withEvent:event]) {
            return self.itemCenterBtn;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
            
            return [super hitTest:point withEvent:event];
        }
    }
    
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
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
