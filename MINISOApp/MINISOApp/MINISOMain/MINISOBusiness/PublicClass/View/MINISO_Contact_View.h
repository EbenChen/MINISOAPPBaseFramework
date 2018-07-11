//
//  MINISO_Contact_View.h
//  MINISOApp
//
//  Created by LJ on 2018/7/6.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MINISO_Contact_View : UIView

@property (weak, nonatomic) IBOutlet UIImageView *portraintImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UIView *uplineView;
@property (weak, nonatomic) IBOutlet UIView *downlineView;


+(MINISO_Contact_View *)instanceView;

@end
