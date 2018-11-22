//
//  MINISOAttachmentPreviewViewController.m
//  MINISOApp
//
//  Created by Eben chen on 2018/11/22.
//  Copyright © 2018 Ebenchen. All rights reserved.
//

#import "MINISOAttachmentPreviewViewController.h"
#import "MINISOAppModelMirror.h"
#import <QuickLook/QuickLook.h>

@interface MINISOAttachmentPreviewViewController ()<QLPreviewControllerDataSource>

@property (strong, nonatomic) QLPreviewController *previewVC;
@property (copy, nonatomic) NSURL *fileUrl;

@end

@implementation MINISOAttachmentPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MINISOWhiteColor;
    
    self.previewVC = [[QLPreviewController alloc] init];
    self.previewVC.dataSource = self;
    
    [self previewTypeSeleted];
}

- (void)previewTypeSeleted {
    if (self.type == 1) {
        [self previewNativeFileWithFileName:self.fileName];
    } else {
        [self previewOnlineFileWithUrl:self.fileName];
    }
}

//预览本地文件
- (void)previewNativeFileWithFileName:(NSString *)fileName {
    self.fileUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileName ofType:nil]];
    [self presentViewController:self.previewVC animated:YES completion:nil];
}

//预览网络文件
- (void)previewOnlineFileWithUrl:(NSString *)urlString {
    //urlString = @"https://www.tutorialspoint.com/ios/ios_tutorial.pdf";
    NSString *fileName = [urlString lastPathComponent]; //获取文件名称
    if ([self isFileExist:fileName]) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSURL *url = [documentsDirectoryURL URLByAppendingPathComponent:fileName];
        [self previewFileWithUrl:url];
    } else {
        [MBProgressHUD showMessage:@"下载中.."];
        [MINISOAppModelMirror downloadFileWithApiUrl:urlString successBlock:^(id result) {
            [MBProgressHUD hideHUD];
            if (result) {
                NSURL *url = (NSURL *)result;
                [self previewFileWithUrl:url];
            }
        } failBlock:^(NSString *msg) {
            [MBProgressHUD hideHUD];
        } networkErrorBlock:^(NSError *error) {
            [MBProgressHUD hideHUD];
        }];
    }
}

//预览附件
- (void)previewFileWithUrl:(NSURL *)url {
    self.fileUrl = url;
    [self presentViewController:self.previewVC animated:YES completion:nil];
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
