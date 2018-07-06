//
//  UITableView+MINISOExtensions.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/29.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "UITableView+MINISOExtensions.h"

@implementation UITableView (MINISOExtensions)

- (void)registerNibWithClassName:(Class)className{
    NSString *identify = NSStringFromClass(className);
    [self registerNib:[UINib nibWithNibName:identify bundle:nil] forCellReuseIdentifier:identify];
}

@end
