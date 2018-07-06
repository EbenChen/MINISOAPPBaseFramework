//
//  MINISOMMQListModel.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MINISOTLQListModel.h"

@interface MINISOMMQListModel : NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSMutableArray *list;

+ (NSDictionary *)objectClassInArray;
+ (Class)objectClassInArray:(NSString *)propertyName;


@end
