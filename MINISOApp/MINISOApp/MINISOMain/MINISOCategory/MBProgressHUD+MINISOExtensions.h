//
//  MBProgressHUD+MINISOExtensions.h
//  MINISOApp
//
//  Created by Eben chen on 2018/7/11.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MINISOExtensions)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showNoneIconMessage:(NSString *)message toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
