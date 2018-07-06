//
//  MINISOUniversalTableView.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/29.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOUniversalTableView.h"
#import "MJRefresh.h"
#import "UITableView+MINISOExtensions.h"
#import "MINISOOnlyContentTextTableViewCell.h"
#import "MINISOContentOneImageTableViewCell.h"
#import "MINISOContentMoreImageTableViewCell.h"


@interface MINISOUniversalTableView ()

@property (nonatomic, assign) id delegate;

@property (nonatomic, copy)NSString *identifier;

@property (nonatomic, copy)NSArray *dataSourceArray;

@property (nonatomic, strong) UITableViewCell *cell;

@property (nonatomic, assign) MINISORegisterCellType currentCellType;

@property (nonatomic, assign) CGFloat cellDefaultHeight;
//section个数：默认为1
@property (nonatomic, assign) NSInteger sectionNumber;

@property (nonatomic, copy) baseTableViewCellSelectBlock tableViewCellSelectBlock;

@property (nonatomic, copy) baseTableViewRefreshBlock tableViewRefreshBlock;

@end

@implementation MINISOUniversalTableView

- (instancetype)initWithFrame:(CGRect)frame tableStyle:(UITableViewStyle)tableStyle delegate:(id)delegate registerCellType:(MINISORegisterCellType)cellType{
    if ([super init] == self) {
        self.delegate = delegate;
        self.sectionNumber = 1;
        self.cellDefaultHeight = 44.0f;
        self.currentCellType = cellType;
        [self createBaseTableViewWithFram:frame tableStyle:tableStyle registerCellType:cellType];
    }
    
    return self;
}

- (void)createBaseTableViewWithFram:(CGRect)frame tableStyle:(UITableViewStyle)tableStyle registerCellType:(MINISORegisterCellType)cellType{
    _baseUniversalTableView = [[UITableView alloc] initWithFrame:frame style:tableStyle];
    _baseUniversalTableView.delegate = self;
    _baseUniversalTableView.dataSource = self;
    _baseUniversalTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //添加刷新
    [self addMJRefreshTableView];
    
    //判断_delegate是什么类型
    if ([self.delegate isKindOfClass:[UIView class]]) {
        [self.delegate addSubview:_baseUniversalTableView];
    } else if([self.delegate isKindOfClass:[UIViewController class]]){
        [((UIViewController *)self.delegate).view addSubview:_baseUniversalTableView];
    } else {
        NSLog(@"delegate is %@",NSStringFromClass(self.delegate));
        assert(self.delegate);
    }
    
    //注册cell
    [self registerTableCellForTheCellType:cellType];
}

//没考虑一个页面有多种cell的情况，后续有在枚举中添加
- (void)registerTableCellForTheCellType:(MINISORegisterCellType)cellTpye {
    switch (cellTpye) {
        case MINISORegisterCellTypeText:
            [self.baseUniversalTableView registerNibWithClassName:[MINISOOnlyContentTextTableViewCell class]];
            break;
        case MINISORegisterCellTypeOneImage:
            [self.baseUniversalTableView registerNibWithClassName:[MINISOContentOneImageTableViewCell class]];
            break;
        case MINISORegisterCellTypeMoreImage:
            [self.baseUniversalTableView registerNibWithClassName:[MINISOContentMoreImageTableViewCell class]];
        default:
            [self.baseUniversalTableView registerNibWithClassName:[MINISOOnlyContentTextTableViewCell class]];
            break;
    }
}

- (void)addMJRefreshTableView {
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullTableViewData)];
    [refreshHeader setTitle:@"再下拉一点就能刷新了" forState:MJRefreshStateIdle];
    [refreshHeader setTitle:@"放开即刷新" forState:MJRefreshStatePulling];
    [refreshHeader setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
    refreshHeader.lastUpdatedTimeLabel.hidden = YES;
    self.baseUniversalTableView.mj_header = refreshHeader;
    self.baseUniversalTableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(uploadTableViewData)];
}

- (void)pullTableViewData {
    self.tableViewRefreshBlock(YES);
    [self.baseUniversalTableView.mj_header endRefreshing];
}

- (void)uploadTableViewData {
    self.tableViewRefreshBlock(NO);
}

- (void)refreshDataBlock:(baseTableViewRefreshBlock) refreshBlock {
    if (!self.tableViewRefreshBlock) {
        self.tableViewRefreshBlock = refreshBlock;
    }
}

- (void)updateListDataFromDataSource:(NSArray *)dataScource {
    self.dataSourceArray = dataScource;
    [self.baseUniversalTableView reloadData];
}

- (void)selectTableViewCell:(baseTableViewCellSelectBlock)tableViewCellSelectBlock {
    if (!self.tableViewCellSelectBlock) {
        self.tableViewCellSelectBlock = tableViewCellSelectBlock;
    }
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataSourceArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MINISOOnlyContentTextTableViewCell *contentCell = [MINISOOnlyContentTextTableViewCell customerOnlyContentTextTableViewCellWithTableView:tableView];
    MINISOTLQListModel *cellObject = self.dataSourceArray[indexPath.row];
    [contentCell updateContentTextCellInformationForModel:cellObject];
    return contentCell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableViewCellSelectBlock) {
        id cellData = [_dataSourceArray objectAtIndex:indexPath.row];
        self.tableViewCellSelectBlock(cellData);
    }
    NSLog(@"未初始化选中回调");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.currentCellType) {
        case MINISORegisterCellTypeText:
            self.cellDefaultHeight = 88.0f;
            break;
        case MINISORegisterCellTypeOneImage:
            self.cellDefaultHeight = 160.0f;
            break;
        case MINISORegisterCellTypeMoreImage:
            self.cellDefaultHeight = 160.0f;
            break;
        default:
            self.cellDefaultHeight = 44.0f;
            break;
    }

    return self.cellDefaultHeight;
}

@end
