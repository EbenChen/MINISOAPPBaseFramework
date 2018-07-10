//
//  MINISOTLQListModel.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MINISOTLQListModel : NSObject

@property (assign, nonatomic) NSInteger fid;
@property (copy, nonatomic) NSString *forum_name;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *siteflag;

@end
