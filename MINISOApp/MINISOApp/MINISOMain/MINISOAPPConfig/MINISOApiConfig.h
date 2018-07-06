//
//  MINISOApiConfig.h
//  MINISOApp
//
//  Created by Eben chen on 2018/6/26.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#ifndef MINISOApiConfig_h
#define MINISOApiConfig_h

#define NETWORK_HEADER_USERAGENT [NSString stringWithFormat:@"%@/%@ (%@;iOS %@;%li*%li)",@"MINISOPURCHASE",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],[UIDevice currentDevice].model,[UIDevice currentDevice].systemVersion,(long)[UIScreen mainScreen].bounds.size.width,(long)[UIScreen mainScreen].bounds.size.height]

#define DEFAULT_USERAGENT_SETTING [[NSUserDefaults standardUserDefaults] setObject:NETWORK_HEADER_USERAGENT forKey:@"USERAGENT"]
#define SYNC_DEFAULT_USERAGENT [[NSUserDefaults standardUserDefaults] synchronize]

//请求设备来源，客户端自定义
#define MINISO_API_DEVICE_SOURCE 2

#define MINISO_DOMAIN_PREFIX               @"papi.mama.cn"
#define MINISO_API_HOST [NSString stringWithFormat:@"https://%@",MINISO_DOMAIN_PREFIX]

//首页主页
#define MINISO_HOME_API [NSString stringWithFormat:@"%@/api/forum/getfunforumlist", MINISO_API_HOST]
#define MINISO_API_REMIND_CLASS_COMPLETE [NSString stringWithFormat:@"%@/api/remind/class_complete.php", MINISO_API_HOST]


#endif /* MINISOApiConfig_h */
