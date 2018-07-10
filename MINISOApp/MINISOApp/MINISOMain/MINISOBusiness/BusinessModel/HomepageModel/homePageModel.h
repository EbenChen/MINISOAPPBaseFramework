//
//  homePageModel.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOApiBaseModel.h"
#import "homePageDataModel.h"

@interface homePageModel : MINISOApiBaseModel

@property (nonatomic, strong) homePageDataModel *data;

@end
