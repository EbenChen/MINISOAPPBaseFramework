//
//  MINISOLoginViewController.m
//  MINISOQAS
//
//  Created by Eben chen on 2018/7/11.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOLoginViewController.h"

@interface MINISOLoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *loginLogIcon;
@property (weak, nonatomic) IBOutlet UITextField *loginUserName;
@property (weak, nonatomic) IBOutlet UITextField *loginUserPwd;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation MINISOLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loingBtnClicked:(UIButton *)sender {
   
    if (self.loginUserName.text.length > 0 && self.loginUserPwd.text.length > 0) {
        //测试构造登陆用户信息
        MINISOUserModel *tempObj = [MINISOUserModel new];
        tempObj.isLogin = YES;
        tempObj.userName = self.loginUserName.text;
        tempObj.userId = self.loginUserPwd.text;
        tempObj.userAuthority = MINISOUserAuthorityLayer2;
        tempObj.authorToken = @"GZ201807170918003418floor";
        
        [[MINISOUserInformationModel currentUserModel] saveUserModelInUserDefaults:tempObj];
        
        if (self.callBack) {
            self.callBack();
        }
    } else {
        [MBProgressHUD showError:@"用户名或者密码不能为空"];
    }

}

@end
