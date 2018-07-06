//
//  MINISOTabbarItemModel.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/21.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MINISOTabbarItemModel : NSObject

@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *itemDefaultIcon;
@property (nonatomic, strong) NSString *itemSelectedIcon;
@property (nonatomic, strong) NSString *itemBadgeValue; //-1表示仅显示小红点
@property (nonatomic, assign) NSInteger itemIndex;

@end
