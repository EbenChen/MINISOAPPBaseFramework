//
//  MINISOHomeItemViewController.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/21.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOHomeItemViewController.h"
#import "MINISOUniversalTableView.h"
#import "MINISOOnlyContentTextTableViewCell.h"
#import "MINISOAppModelMirror.h"
#import "homePageModel.h"

#import "homePageTempListVC.h"

@interface MINISOHomeItemViewController ()

@property (nonatomic, strong) MINISOUniversalTableView *listTable;

@end

@implementation MINISOHomeItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加tableview
    [self createListTableView];
    //请求数据
    [self requestTableViewData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    //[self.navigationController navigationTransparentState:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createListTableView {
    self.listTable = [[MINISOUniversalTableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 49) tableStyle:UITableViewStylePlain delegate:self registerCellType:MINISORegisterCellTypeText];
    [self.listTable selectTableViewCell:^(id cellModelData) {
        MINISOTLQListModel *cellModel = (MINISOTLQListModel *)cellModelData;
        
        homePageTempListVC *tmpListVC =[[homePageTempListVC alloc] initWithNibName:@"homePageTempListVC" bundle:nil];
        tmpListVC.hidesBottomBarWhenPushed = YES;
        tmpListVC.title = cellModel.forum_name;
        //[self.navigationController navigationTransparentState:YES];
        [self.navigationController pushViewController:tmpListVC animated:YES];
    }];
    //刷新回调
    [self.listTable refreshDataBlock:^(BOOL refreshDirection) {
        if (refreshDirection) {
            //下拉刷新
            NSLog(@"下拉");
        } else {
            //上拉刷新
            NSLog(@"上拉");
        }
    }];
}

- (void)requestTableViewData {
    [MINISOAppModelMirror getAllFourmCategoryWithMode:@"2" bb_birthday:@"2018-06-27" cityName:@"广州" successBlock:^(id result) {
        if (result) {
            homePageModel *homeModel = (homePageModel *)result;
            NSLog(@"%@",homeModel);
            [self.listTable updateListDataFromDataSource:homeModel.data.tlq];
        }
    } failBlock:^(NSString *msg) {
        
    } networkErrorBlock:^(NSError *error) {
        
    }];

}

@end
