//
//  MINISOAttachmentTools.h
//  MINISOApp
//
//  Created by Eben chen on 2018/11/22.
//  Copyright © 2018 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>
#import "MINISOAppModelMirror.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^preViewVCBlock)(QLPreviewController *QLPVC);

@interface MINISOAttachmentTools : NSObject<QLPreviewControllerDataSource>

@property (strong, nonatomic) QLPreviewController *previewVC;
@property (copy, nonatomic) NSURL *fileUrl;

- (void)persentPreviewVCWithType:(NSInteger)type fileUrl:(NSString *)fileUrl finishBlock:(preViewVCBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
