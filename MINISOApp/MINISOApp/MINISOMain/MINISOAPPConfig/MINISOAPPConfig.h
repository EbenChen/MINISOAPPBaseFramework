//
//  MINISOAPPConfig.h
//  MINISOApp
//
//  Created by Eben chen on 2018/7/2.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#pragma mark ---NSUserDefaults
#define SetUserDefaultKeyWithObject(key,object) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]
#define SetUserBoolKeyWithObject(key,object) [[NSUserDefaults standardUserDefaults] setBool:object forKey:key]
#define SetUserIntegerKeyWithObject(key,object) [[NSUserDefaults standardUserDefaults] setInteger:object forKey:key]

#define GetUserDefaultWithKey(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define GetUserDefaultBoolWithKey(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]
#define GetUserDefaultIntegerWithKey(key) [[NSUserDefaults standardUserDefaults] integerForKey:key]

#define DeleUserDefaultWithKey(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]
#define UserDefaultSynchronize  [[NSUserDefaults standardUserDefaults] synchronize]

#pragma mark ---register key

#pragma mark --- IOS version
#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IS_IOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IS_IOS11 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)

#pragma mark ---mainScreen size
#define STATUSBAR_ISHIDDEN [[UIApplication sharedApplication] isStatusBarHidden]
#define STATUS_BAR_HEIGHT   (STATUSBAR_ISHIDDEN ?  0.0f : [UIApplication sharedApplication].statusBarFrame.size.height)
#define TABBAR_HEGHT 49
#define SCREEN_SAFE_HEIGHT (MAINSCREEN_HEIGHT - TABBAR_HEGHT - 64)
#define SCREEN_HEIGHT      [UIScreen mainScreen].bounds.size.height -  STATUS_BAR_HEIGHT
#define MAINSCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
///获取设备屏幕宽度
#define MAINSCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width

#pragma mark ---UIColor
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGBSAMECOLOR(x) [UIColor colorWithRed:(x)/255.0 green:(x)/255.0 blue:(x)/255.0 alpha:1]

#define MINISOClearColor [UIColor clearColor]
#define MINISOBlackColor [UIColor blackColor]
#define MINISOWhiteColor [UIColor whiteColor]
#define MINISOGrayColor [UIColor grayColor]
#define MINISORedColor [UIColor redColor]
#define MINISOTabBarTitleDefaultColor RGBSAMECOLOR(113)
#define MINISOTabBarTitleSelectedColor RGBCOLOR(100, 174, 234)
#define MINISONavigationBgColor RGBCOLOR(133,134,213)
#define MINISONavigationTitleColor [UIColor whiteColor]
#define MINISONavigationTintColor [UIColor whiteColor]

#pragma mark ---默认占位图
//正方形
#define DEFAULT_SQUARE_IMG [UIImage imageNamed:@"defaultSquareImg"]
//长方形
#define DEFAULT_RECTANGLE_IMG [UIImage imageNamed:@"defaultRectangleImg"]

#pragma mark --log defined
#ifdef DEBUG
#define MINISOLog(...) printf(__VA_ARGS__)
#else
#define MINISOLog(...)
#endif
#define CLASS_METHOD [NSString stringWithFormat:@"%s %d 行 \n",__func__,__LINE__]
#ifdef DEBUG
#define APPLog(...) printf("%s %s\n\n", [CLASS_METHOD UTF8String], [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define APPLog(...)
#endif
