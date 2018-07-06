//
//  MINISOOnlyContentTextTableViewCell.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/29.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MINISOTLQListModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MINISOOnlyContentTextTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


+ (instancetype)customerOnlyContentTextTableViewCellWithTableView:(UITableView *)tableView;

- (void)updateContentTextCellInformationForModel:(MINISOTLQListModel *)cellModel;

@end
