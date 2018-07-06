//
//  MINISOContentOneImageTableViewCell.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/29.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOContentOneImageTableViewCell.h"

@implementation MINISOContentOneImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
