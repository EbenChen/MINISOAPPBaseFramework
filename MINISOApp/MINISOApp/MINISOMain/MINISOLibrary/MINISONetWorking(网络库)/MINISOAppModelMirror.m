//
//  MINISOAppModelMirror.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISOAppModelMirror.h"
#import "AFHTTPSessionManager.h"
#import "MINISOAppSystem.h"
#import "MINISOApiConfig.h"
#import "NSMutableDictionary+MINISOExtensions.h"

@implementation MINISOAppModelMirror

//上传单张图片
+ (void)uploadOneImageDataWithImageName:(NSString *)imgName uid:(NSString *)uid successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:0];
    //系统级别参数
    [data addEntriesFromDictionary:[MINISOAppSystem getSystemParameterData]];
    //其他参数
    [data setNotNilObject:imgName forKey:@"name"];
    [data setNotNilObject:uid forKey:@"uid"];
    
    //生成sign
    NSString *sign = [MINISOAppSystem appendSign:data withAppSecretKey:[MINISOAppSystem getSystemSecretKey:MINISO_APP_SECURE_KEY]];
    [data setNotNilObject:sign forKey:@"sign"];
    //组合url
    NSString *url = [MINISOAppSystem GetURLBySeparateFromDic:data withURLPrefix:MINISO_HOME_API];
    
    //上传图片
    UIImage *image = [UIImage imageNamed:imgName];
    
    AFHTTPSessionManager *networkManager = [AFHTTPSessionManager manager];
    networkManager.requestSerializer.timeoutInterval = 20;
    networkManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"multipart/form-data"]];
    [networkManager POST:url parameters:data constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSDate *date = [NSDate date];
        NSDateFormatter *formormat = [[NSDateFormatter alloc]init];
        [formormat setDateFormat:@"HHmmss"];
        NSString *dateString = [formormat stringFromDate:date];
        
        NSString *fileName = [NSString  stringWithFormat:@"%@.png",dateString];
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        double scaleNum = (double)300 * 1024/imageData.length;
        NSLog(@"图片压缩率：%f",scaleNum);
        
        if (scaleNum <1) {
            imageData = UIImageJPEGRepresentation(image, scaleNum);
        } else {
            imageData = UIImageJPEGRepresentation(image, 0.1);
        }
        
        [formData  appendPartWithFileData:imageData name:@"files" fileName:fileName mimeType:@"image/jpg/png/jpeg"];

    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"---%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"`````````%@",responseObject);
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        networkErrorBlock(error);
    }];
}

//上传多张
+ (void)uploadOneImageDataWithImgArray:(NSArray *)imgArray uid:(NSString *)uid  successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:0];
    //系统级别参数
    [data addEntriesFromDictionary:[MINISOAppSystem getSystemParameterData]];
    //其他参数
    [data setNotNilObject:uid forKey:@"uid"];
    
    //生成sign
    NSString *sign = [MINISOAppSystem appendSign:data withAppSecretKey:[MINISOAppSystem getSystemSecretKey:MINISO_APP_SECURE_KEY]];
    [data setNotNilObject:sign forKey:@"sign"];
    //组合url
    NSString *url = [MINISOAppSystem GetURLBySeparateFromDic:data withURLPrefix:MINISO_HOME_API];
    
    AFHTTPSessionManager *networkManager = [AFHTTPSessionManager manager];
    networkManager.requestSerializer.timeoutInterval = 20;
    networkManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"multipart/form-data"]];
    [networkManager POST:url parameters:data constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i <[imgArray count]; i++) {
            
            UIImage * image =[UIImage  imageNamed:imgArray[i]];
            NSDate *date = [NSDate date];
            NSDateFormatter *formormat = [[NSDateFormatter alloc]init];
            [formormat setDateFormat:@"HHmmss"];
            NSString *dateString = [formormat stringFromDate:date];
            
            NSString *fileName = [NSString  stringWithFormat:@"%@.png",dateString];
            NSData *imageData = UIImageJPEGRepresentation(image, 1);
            double scaleNum = (double)300*1024/imageData.length;
            NSLog(@"图片压缩率：%f",scaleNum);
            
            if (scaleNum < 1) {
                
                imageData = UIImageJPEGRepresentation(image, scaleNum);
            } else {
                imageData = UIImageJPEGRepresentation(image, 0.1);
            }
            
            [formData  appendPartWithFileData:imageData name:@"files" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"---%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"`````````%@",responseObject);
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        networkErrorBlock(error);
    }];
}

+ (void)uploadVideoDataWithVideoPath:(NSString *)videoPath uid:(NSString *)uid successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:0];
    //系统级别参数
    [data addEntriesFromDictionary:[MINISOAppSystem getSystemParameterData]];
    //其他参数
    [data setNotNilObject:uid forKey:@"uid"];
    
    //生成sign
    NSString *sign = [MINISOAppSystem appendSign:data withAppSecretKey:[MINISOAppSystem getSystemSecretKey:MINISO_APP_SECURE_KEY]];
    [data setNotNilObject:sign forKey:@"sign"];
    //组合url
    NSString *url = [MINISOAppSystem GetURLBySeparateFromDic:data withURLPrefix:MINISO_HOME_API];
    
    //此处为对视频进行转码并且压缩为，最终输出为MP4的格式
    //输出后将文件保存到了/Library/Caches/文件夹内
    NSURL *dataUrl = [NSURL URLWithString:videoPath];
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:dataUrl options:nil];
    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset presetName:AVAssetExportPresetMediumQuality];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    NSString *mp4Path = [NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches/output-%@.mp4", [formater stringFromDate:[NSDate date]]];
    exportSession.outputURL = [NSURL fileURLWithPath: mp4Path];
    exportSession.outputFileType = AVFileTypeMPEG4;
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        switch ([exportSession status]) {
            case AVAssetExportSessionStatusFailed:
            {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"错误"
                                                                message:[[exportSession error] localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
                [alert show];
                break;
            }
                
            case AVAssetExportSessionStatusCancelled:
                
                break;
            case AVAssetExportSessionStatusCompleted:
            {
                
                AFHTTPSessionManager *networkManager = [AFHTTPSessionManager manager];
                networkManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
                [networkManager POST:url parameters:data constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                    NSData *videoData = [NSData dataWithContentsOfFile:mp4Path];
                    [formData appendPartWithFileData:videoData name:@"MINISOvideo01" fileName:@"MINISOvideo01.mp4" mimeType:@"video/mpeg4"];
                } progress:^(NSProgress * _Nonnull uploadProgress) {
                    NSLog(@"---%@",uploadProgress);
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSLog(@"%@", responseObject);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    networkErrorBlock(error);
                }];
                break;
            }
            default:
                break;
        }
    }];
}

+ (void)uploadFileWithFileUrl:(NSString *)fileUrl uid:(NSString *)uid successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:0];
    //系统级别参数
    [data addEntriesFromDictionary:[MINISOAppSystem getSystemParameterData]];
    //其他参数
    [data setNotNilObject:uid forKey:@"uid"];
    
    //生成sign
    NSString *sign = [MINISOAppSystem appendSign:data withAppSecretKey:[MINISOAppSystem getSystemSecretKey:MINISO_APP_SECURE_KEY]];
    [data setNotNilObject:sign forKey:@"sign"];
    //组合url
    NSString *url = [MINISOAppSystem GetURLBySeparateFromDic:data withURLPrefix:MINISO_HOME_API];
    

    AFHTTPSessionManager *networkManager = [AFHTTPSessionManager manager];
    networkManager.requestSerializer.timeoutInterval = 20;
    networkManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"multipart/form-data"]];
    [networkManager POST:url parameters:data constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:fileUrl] name:@"file" error:nil];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"---%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        networkErrorBlock(error);
    }];
}

+ (void)downloadFileWithApiUrl:(NSString *)downloadUrl uid:(NSString *)uid successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:downloadUrl]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLSessionDownloadTask *download = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //下载进度
        NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        successBlock(response);
        //保存的文件路径
        NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL fileURLWithPath:fullPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        networkErrorBlock(error);
    }];
    //执行Task
    [download resume];
}

//get方式请求示例
+ (void)getAllFourmCategoryWithMode:(NSString *)mode bb_birthday:(NSString *)bb_birthday cityName:(NSString *)cityName successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:0];
    //系统级参数
    [data addEntriesFromDictionary:[MINISOAppSystem getSystemParameterData]];
    
    //其他参数
    [data setNotNilObject:bb_birthday forKey:@"bb_birthday"];
    [data setNotNilObject:mode forKey:@"mode"];
    [data setNotNilObject:cityName forKey:@"city_name"];
    
    //生成sign
    NSString *sign = [MINISOAppSystem appendSign:data withAppSecretKey:[MINISOAppSystem getSystemSecretKey:MINISO_APP_SECURE_KEY]];
    [data setNotNilObject:sign forKey:@"sign"];
    //组合url
    NSString *url = [MINISOAppSystem GetURLBySeparateFromDic:data withURLPrefix:MINISO_HOME_API];
    
    //初始化manager
    AFHTTPSessionManager *netWorkManager = [AFHTTPSessionManager manager];
    netWorkManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [netWorkManager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            homePageModel *dataModel = [homePageModel mj_objectWithKeyValues:responseObject];
            if (dataModel && dataModel.code == 0) {
                successBlock(dataModel);
            } else {
                failBlock(dataModel.msg);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        networkErrorBlock(error);
    }];
}

//post方式请求示例
+ (void)postStatisticsOfUserOpenAPNSWithDay:(NSInteger)day mode:(NSInteger)mode successBlock:(UniversalCompletionBlock)successBlock failBlock:(NewErrmsgBlock)failBlock networkErrorBlock:(NetworkErrorBlock)networkErrorBlock {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithCapacity:0];
    //系统级参数
    [data addEntriesFromDictionary:[MINISOAppSystem getSystemParameterData]];
    //其他参数
    [data setStringObject:@(day) forKey:mode==1?@"days":@"week"];
    [data setStringObject:@(mode) forKey:@"mode"];
    //生成token
    NSString *token = [MINISOAppSystem appendSign:data withAppSecretKey:[MINISOAppSystem getSystemSecretKey:MINISO_APP_SECURE_KEY]];
    [data setStringObject:token forKey:@"token"];
    //组合url
    NSString *info = [MINISOAppSystem GetURLBySeparateFromDic:data withURLPrefix:nil];
    NSLog(@"%@",info);
    
    AFHTTPSessionManager *netWorkManager = [AFHTTPSessionManager manager];
    netWorkManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [netWorkManager POST:MINISO_API_REMIND_CLASS_COMPLETE parameters:info progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        networkErrorBlock(error);
    }];
}

@end
