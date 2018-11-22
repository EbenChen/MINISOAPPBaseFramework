//
//  MINISOAttachmentTools.m
//  MINISOApp
//
//  Created by Eben chen on 2018/11/22.
//  Copyright © 2018 Ebenchen. All rights reserved.
//

#import "MINISOAttachmentTools.h"

@implementation MINISOAttachmentTools

- (void)persentPreviewVCWithType:(NSInteger)type fileUrl:(NSString *)fileUrl finishBlock:(preViewVCBlock)finishBlock {
    self.previewVC = [[QLPreviewController alloc] init];
    
    //修改了这个外观对象，相当于修改了整个项目中的外观
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    //设置导航栏背景颜色
    [navigationBar setBarTintColor:MINISONavigationBgColor];
    //设置NavigationBarItem文字的颜色
    [navigationBar setTintColor:MINISOTabBarTitleSelectedColor];
    //设置标题栏颜色
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:MINISOTabBarTitleSelectedColor,NSFontAttributeName : [UIFont systemFontOfSize:18]};
    
    self.previewVC.dataSource = self;
    
    if (type == 1) {
        [self previewNativeFileWithFileName:fileUrl presentBlock:finishBlock];
        
    } else {
        [self previewOnlineFileWithUrl:fileUrl presentBlock:finishBlock];
    }
}

//预览本地文件
- (void)previewNativeFileWithFileName:(NSString *)fileName presentBlock:(preViewVCBlock)block {
    self.fileUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileName ofType:nil]];
    block(self.previewVC);
}

//预览网络文件
- (void)previewOnlineFileWithUrl:(NSString *)urlString presentBlock:(preViewVCBlock)block {
    //urlString = @"https://www.tutorialspoint.com/ios/ios_tutorial.pdf";
    NSString *fileName = [urlString lastPathComponent]; //获取文件名称
    if ([self isFileExist:fileName]) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSURL *url = [documentsDirectoryURL URLByAppendingPathComponent:fileName];
        [self previewFileWithUrl:url presentBlock:block];
    } else {
        [MBProgressHUD showMessage:@"下载中.."];
        [MINISOAppModelMirror downloadFileWithApiUrl:urlString successBlock:^(id result) {
            [MBProgressHUD hideHUD];
            if (result) {
                NSURL *url = (NSURL *)result;
                [self previewFileWithUrl:url presentBlock:block];
            }
        } failBlock:^(NSString *msg) {
            [MBProgressHUD hideHUD];
        } networkErrorBlock:^(NSError *error) {
            [MBProgressHUD hideHUD];
        }];
    }
}

//预览附件
- (void)previewFileWithUrl:(NSURL *)url presentBlock:(preViewVCBlock)block {
    self.fileUrl = url;
    //[self presentViewController:self.previewVC animated:YES completion:nil];
    block(self.previewVC);
}

//判断文件是否已经在沙盒中存在
- (BOOL)isFileExist:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    return result;
}

#pragma mark -QLPreviewControllerDataSource

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return self.fileUrl;
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)previewController{
    return 1;
}

@end
