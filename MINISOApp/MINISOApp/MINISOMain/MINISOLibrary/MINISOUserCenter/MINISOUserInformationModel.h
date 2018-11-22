//
//  MINISOUserInformationModel.h
//  MINISOQAS
//
//  Created by Eben chen on 2018/7/16.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, MINISOUserAuthority) {
    MINISOUserAuthorityLayer1 = 1, //最高权限
    MINISOUserAuthorityLayer2,
    MINISOUserAuthorityLayer3,
    MINISOUserAuthorityLayer4,
    MINISOUserAuthorityLayer5,
    MINISOUserAuthorityLayer6,
    MINISOUserAuthorityLayer7,
    MINISOUserAuthorityLayer8,
    MINISOUserAuthorityLayer9,
    MINISOUserAuthorityLayer10,
    MINISOUserAuthorityLayer11,
    MINISOUserAuthorityLayer12,
    MINISOUserAuthorityLayer13,
    MINISOUserAuthorityLayer14,
    MINISOUserAuthorityLayer15,
    MINISOUserAuthorityLayer16,
    MINISOUserAuthorityLayer17,
    MINISOUserAuthorityLayer18,
    MINISOUserAuthorityLayer19,
    MINISOUserAuthorityLayer20,
    MINISOUserAuthorityLayer21,
    MINISOUserAuthorityUnknown = 0//没任何权限
};

@interface MINISOUserInformationModel : NSObject<NSCopying,NSMutableCopying>

@property (nonatomic, strong) MINISOUserModel *userModel;

+ (instancetype)currentUserModel;

- (void)saveUserModelInUserDefaults:(MINISOUserModel *)model;

- (void)logoutClearNativeData;

- (BOOL)obtainUsrIsLogin;

- (MINISOUserModel *)obtainUserInformationModel;

@end
