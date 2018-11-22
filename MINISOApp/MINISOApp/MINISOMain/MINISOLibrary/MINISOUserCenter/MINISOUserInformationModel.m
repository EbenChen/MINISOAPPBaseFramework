//
//  MINISOUserInformationModel.m
//  MINISOQAS
//
//  Created by Eben chen on 2018/7/16.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOUserInformationModel.h"

#define USER_NAME @"userName"
#define USER_ID @"userId"
#define AUTHOR_TOKEN @"authorToken"
#define LOGIN_STATE @"isLogin"
#define USER_AUTHORITY @"userAuthority"


@implementation MINISOUserInformationModel

//ARC状态下的单例对象创建
//注意这里用的是self，不要直接用类名写死，没有拓展性
+ (instancetype)currentUserModel
{
    return [[self alloc] init];
}

//注意：创建对象：都是alloc、new、类方法创建，但内部本质还是[alloc init]，所以要考虑alloc内部所调用的方法

//1.static定义的是一个静态的全局变量，会存放在静态区里面，只会保留一份，赋过一次值之后，就不再为nil
//2.分配存储空间的代码只执行一次，这样保证了无论是单线程还是多线程都只创建一次对象
static MINISOUserInformationModel *_instance;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    // 由于alloc方法内部会调用allocWithZone: 所以我们只需要保证在该方法只创建一个对象即可
    dispatch_once(&onceToken,^{
        // 只执行1次的代码(这里面默认是线程安全的)
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

//因为copy方法必须通过实例对象调用, 所以可以直接返回_instance
- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}

//保存model数据到本地
- (void)saveUserModelInUserDefaults:(MINISOUserModel *)model {
    self.userModel = model;
    SetUserDefaultKeyWithObject(USER_NAME, model.userName);
    SetUserDefaultKeyWithObject(USER_ID, model.userId);
    SetUserDefaultKeyWithObject(AUTHOR_TOKEN, model.authorToken);
    SetUserIntegerKeyWithObject(USER_AUTHORITY, model.userAuthority);
    SetUserBoolKeyWithObject(LOGIN_STATE, model.isLogin);
    UserDefaultSynchronize;
}

//仅仅做数据清除
- (void)logoutClearNativeData {
    DeleUserDefaultWithKey(USER_NAME);
    DeleUserDefaultWithKey(USER_ID);
    DeleUserDefaultWithKey(USER_AUTHORITY);
    DeleUserDefaultWithKey(AUTHOR_TOKEN);
    DeleUserDefaultWithKey(LOGIN_STATE);
}

- (BOOL)obtainUsrIsLogin {
    //首次拿登陆状态给当前用户获取本地数据
    if (self.userModel == nil) {
        [self evaluateForModelEmpty];
    }
    
    return  GetUserDefaultBoolWithKey(LOGIN_STATE);
}

- (MINISOUserModel *)obtainUserInformationModel {
    if (self.userModel == nil) {
        [self evaluateForModelEmpty];
    }
    
    return self.userModel;
}

//初始赋值给对象model
- (void)evaluateForModelEmpty {
    self.userModel = [MINISOUserModel new];
    self.userModel.userName = GetUserDefaultWithKey(USER_NAME);
    self.userModel.userId = GetUserDefaultWithKey(USER_ID);
    self.userModel.authorToken = GetUserDefaultWithKey(AUTHOR_TOKEN);
    self.userModel.isLogin = GetUserDefaultBoolWithKey(LOGIN_STATE);
    self.userModel.userAuthority = GetUserDefaultIntegerWithKey(USER_AUTHORITY);
}

@end
