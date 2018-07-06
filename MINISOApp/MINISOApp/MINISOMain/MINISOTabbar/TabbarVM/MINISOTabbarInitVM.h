//
//  MINISOTabbarInitVM.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/22.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MINISOTabBarController.h"
#import "MINISOTabbarItemModel.h"
#import "MINISOHomeItemViewController.h"
#import "MINISOShoppingItemViewController.h"
#import "MINISOOrdersItemViewController.h"
#import "MINISOVerbItemViewController.h"
#import "MINISOCenterItemViewController.h"

@interface MINISOTabbarInitVM : NSObject

@property (nonatomic, strong) MINISOTabbarItemModel *homeItemModel;
@property (nonatomic, strong) MINISOTabbarItemModel *ordersItemModel;
@property (nonatomic, strong) MINISOTabbarItemModel *shoppingItemModel;
@property (nonatomic, strong) MINISOTabbarItemModel *verbsItemModel;
@property (nonatomic, strong) MINISOTabbarItemModel *centerItemModel;

- (MINISOTabBarController *)tabBarInitItemToKeyWindoForItemVC;

@end
