//
//  homePageDataModel.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MINISOMMQListModel.h"

@interface homePageDataModel : NSObject

@property (strong,nonatomic) NSMutableArray *tlq;
@property (strong,nonatomic) NSMutableArray *mmq;

+ (NSDictionary *)objectClassInArray;
+ (Class)objectClassInArray:(NSString *)propertyName;

@end
