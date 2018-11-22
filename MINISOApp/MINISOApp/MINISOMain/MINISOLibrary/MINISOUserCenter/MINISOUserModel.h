//
//  MINISOUserModel.h
//  MINISOQAS
//
//  Created by Eben chen on 2018/7/16.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MINISOUserModel : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *authorToken;
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, assign) NSInteger userAuthority;

@end
