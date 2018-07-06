//
//  MINISOUniversalTableView.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/29.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,MINISORegisterCellType) {
    MINISORegisterCellTypeText          =   1 << 0,
    MINISORegisterCellTypeOneImage      =   1 << 1,
    MINISORegisterCellTypeMoreImage     =   1 << 2,
};

typedef void (^baseTableViewCellSelectBlock)(id cellModelData);
//yes表示向下，NO表示向上
typedef void (^baseTableViewRefreshBlock)(BOOL refreshDirection);

@interface MINISOUniversalTableView : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *baseUniversalTableView;

//初始化Tableview方法
- (instancetype)initWithFrame:(CGRect)frame tableStyle:(UITableViewStyle)tableStyle delegate:(id)delegate registerCellType:(MINISORegisterCellType)cellType;
//数据更新刷新tableview
- (void)updateListDataFromDataSource:(NSArray *)dataScource;

//刷新回调block
- (void)refreshDataBlock:(baseTableViewRefreshBlock) refreshBlock;

//选中某行cell
- (void)selectTableViewCell:(baseTableViewCellSelectBlock)tableViewCellSelectBlock;


@end
