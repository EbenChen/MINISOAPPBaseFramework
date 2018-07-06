//
//  MINISOAppModelMirror.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "homePageModel.h"

/** 通用的网络请求成功，返回的item对象 */
typedef void (^UniversalCompletionBlock)(id result);
/** 网络请求成功，接口返回错误信息 **/
typedef void (^NewErrmsgBlock)(NSString *msg);
/** 网络请求成功，接口返回错误信息 **/
typedef void (^NewLoginErrmsgBlock)(NSInteger code, NSString *msg);
/** 网络请求错误返回的 Error */
typedef void (^NetworkErrorBlock)(NSError* error);

@interface MINISOAppModelMirror : NSObject

///上传单张图片
+ (void)uploadOneImageDataWithImageName:(NSString *)imgName uid:(NSString *)uid successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock;

///上传多张图片
+ (void)uploadOneImageDataWithImgArray:(NSArray *)imgArray uid:(NSString *)uid successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock;

///上传视频
+ (void)uploadVideoDataWithVideoPath:(NSString *)videoPath uid:(NSString *)uid successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock;

///上传文件
+ (void)uploadFileWithFileUrl:(NSString *)fileUrl uid:(NSString *)uid successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock;

///下载文件
+ (void)downloadFileWithApiUrl:(NSString *)downloadUrl uid:(NSString *)uid successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock;


///get请求示例
+ (void)getAllFourmCategoryWithMode:(NSString *)mode bb_birthday:(NSString *)bb_birthday cityName:(NSString *)cityName successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock;

///post请求示例
+ (void)postStatisticsOfUserOpenAPNSWithDay:(NSInteger)day mode:(NSInteger)mode successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock;

@end
