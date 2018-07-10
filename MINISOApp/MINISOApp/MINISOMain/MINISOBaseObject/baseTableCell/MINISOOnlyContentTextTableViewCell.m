//
//  MINISOOnlyContentTextTableViewCell.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/29.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOOnlyContentTextTableViewCell.h"

@implementation MINISOOnlyContentTextTableViewCell

+ (instancetype)customerOnlyContentTextTableViewCellWithTableView:(UITableView *)tableView {
    static NSString *reuseID = @"MINISOOnlyContentTextTableViewCell";
    MINISOOnlyContentTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:reuseID bundle:nil] forCellReuseIdentifier:reuseID];
        cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateContentTextCellInformationForModel:(MINISOTLQListModel *)cellModel {
    [self.imageIcon sd_setImageWithURL:[NSURL URLWithString:cellModel.icon] placeholderImage:DEFAULT_SQUARE_IMG];
    self.titleLabel.text = cellModel.forum_name;
}

@end
