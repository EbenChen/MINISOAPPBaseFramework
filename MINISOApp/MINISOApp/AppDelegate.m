//
//  AppDelegate.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/20.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "AppDelegate.h"
#import "MINISOTabbarInitVM.h"
#import "MINISOLoginViewController.h"
#import "MINISOGuideViewController.h"

@interface AppDelegate (){
    
    MINISOGuideViewController *guideVC;
    MINISOLoginViewController *loginVC;
    MINISOTabBarController *rootItemVC;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //test push
    
    //初始化入口
    [self createWindowsRootVC];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


////custom Method
//Create root VC Enter
- (void)createWindowsRootVC {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    if ([self isFirstLauch]) {
        [self createGuideVCFunction];
    } else {
        [self appEnterChooseForUserState];
    }
    
    [self.window makeKeyAndVisible];
}

//Create TabBar Item on The KeyWindows
- (MINISOTabBarController *)createTabBarVCToKeyWindos {
    MINISOUserModel *currentModel = [[MINISOUserInformationModel currentUserModel] obtainUserInformationModel];
    MINISOUserAuthority authority = (MINISOUserAuthority)currentModel.userAuthority;
    if ( authority == MINISOUserAuthorityLayer1 ) {
        //角色1
        rootItemVC = [[MINISOTabbarInitVM new] tabBarInitItemToLayer1Role];
    } else if ( authority == MINISOUserAuthorityLayer2) {
        rootItemVC = [[MINISOTabbarInitVM new] tabBarInitItemToLayer2Role];
    } else {
        rootItemVC = [[MINISOTabbarInitVM new] tabBarInitItemToKeyWindoForItemVC];
    }
    
    return rootItemVC;
}

//Create app Enter choose
- (void)appEnterChooseForUserState {
    BOOL loginState = [[MINISOUserInformationModel currentUserModel] obtainUsrIsLogin];
    
    if (!loginState) {
        loginVC = [[MINISOLoginViewController alloc] initWithNibName:@"MINISOLoginViewController" bundle:nil];
        self.window.rootViewController = loginVC;
        MINISOWeakSelf;
        loginVC.callBack = ^{
            weakSelf.window.rootViewController = [weakSelf createTabBarVCToKeyWindos];
        };
    } else {
        self.window.rootViewController = [self createTabBarVCToKeyWindos];
    }
}

//启动app引导页
- (void)createGuideVCFunction {
    guideVC = [[MINISOGuideViewController alloc] init];
    self.window.rootViewController = guideVC;
    MINISOWeakSelf;
    guideVC.callBack = ^{
        [weakSelf appEnterChooseForUserState];
    };
}

//guideVC display 判断是不是首次登录或者版本更新
- (BOOL)isFirstLauch {
    
    //获取当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentAppVersion = infoDic[@"CFBundleShortVersionString"];
    
    //获取上次启动应用保存的appVersion
    NSString *version = GetUserDefaultWithKey(MINISOGUIDEVERSION);
    //版本升级或首次登录
    if (version == nil || ![version isEqualToString:currentAppVersion]) {
        SetUserDefaultKeyWithObject(MINISOGUIDEVERSION, currentAppVersion);
        UserDefaultSynchronize;
        return YES;
    } else {
        return NO;
    }
}

@end
