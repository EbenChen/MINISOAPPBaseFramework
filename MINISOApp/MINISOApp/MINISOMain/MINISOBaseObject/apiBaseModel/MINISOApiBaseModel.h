//
//  MINISOApiBaseModel.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+MJKeyValue.h"

@interface MINISOApiBaseModel : NSObject

/// code=0表示接口返回正常
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *msg;

@end
