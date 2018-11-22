//
//  MINISOAttachmentPreviewViewController.h
//  MINISOApp
//
//  Created by Eben chen on 2018/11/22.
//  Copyright © 2018 Ebenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MINISOAttachmentPreviewViewController : UIViewController

@property (nonatomic, strong) NSString *fileName;
//本地or网络
@property (nonatomic, assign) NSInteger type;

@end

NS_ASSUME_NONNULL_END
