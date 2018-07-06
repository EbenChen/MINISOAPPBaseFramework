//
//  UIDevice+MINISOExtensions.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/28.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "UIDevice+MINISOExtensions.h"
#import <sys/utsname.h>

@implementation UIDevice (MINISOExtensions)

+ (NSString *)deviceName
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *productType = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([productType isEqualToString:@"iPhone1,1"]) return @"iPhone 1";
    
    if ([productType isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([productType isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([productType isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([productType isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([productType isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([productType isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([productType isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([productType isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([productType isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([productType isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([productType isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([productType isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([productType isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([productType isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([productType isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([productType isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([productType isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([productType isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([productType isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    
    if ([productType isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([productType isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    
    if ([productType isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([productType isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    
    if ([productType isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([productType isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    
    if ([productType isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([productType isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    if ([productType isEqualToString:@"iPod1,1"]) return @"iPod Touch 1";
    
    if ([productType isEqualToString:@"iPod2,1"]) return @"iPod Touch 2";
    
    if ([productType isEqualToString:@"iPod3,1"]) return @"iPod Touch 3";
    
    if ([productType isEqualToString:@"iPod4,1"]) return @"iPod Touch 4";
    
    if ([productType isEqualToString:@"iPod5,1"]) return @"iPod Touch 5";
    
    if ([productType isEqualToString:@"iPod7,1"]) return @"iPod Touch 6";
    
    if ([productType isEqualToString:@"iPad1,1"]) return @"iPad 1";
    
    if ([productType isEqualToString:@"iPad2,1"]) return @"iPad 2";
    if ([productType isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([productType isEqualToString:@"iPad2,3"]) return @"iPad 2";
    if ([productType isEqualToString:@"iPad2,4"]) return @"iPad 2";
    
    if ([productType isEqualToString:@"iPad2,5"]) return @"iPad Mini 1";
    if ([productType isEqualToString:@"iPad2,6"]) return @"iPad Mini 1";
    if ([productType isEqualToString:@"iPad2,7"]) return @"iPad Mini 1";
    
    if ([productType isEqualToString:@"iPad3,1"]) return @"iPad 3";
    if ([productType isEqualToString:@"iPad3,2"]) return @"iPad 3";
    if ([productType isEqualToString:@"iPad3,3"]) return @"iPad 3";
    
    if ([productType isEqualToString:@"iPad3,4"]) return @"iPad 4";
    if ([productType isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([productType isEqualToString:@"iPad3,6"]) return @"iPad 4";
    
    if ([productType isEqualToString:@"iPad4,1"]) return @"iPad Air 1";
    if ([productType isEqualToString:@"iPad4,2"]) return @"iPad Air 1";
    if ([productType isEqualToString:@"iPad4,3"]) return @"iPad Air 1";
    
    if ([productType isEqualToString:@"iPad4,4"]) return @"iPad Mini 2";
    if ([productType isEqualToString:@"iPad4,5"]) return @"iPad Mini 2";
    if ([productType isEqualToString:@"iPad4,6"]) return @"iPad Mini 2";
    
    if ([productType isEqualToString:@"iPad4,7"]) return @"iPad Mini 3";
    if ([productType isEqualToString:@"iPad4,8"]) return @"iPad Mini 3";
    if ([productType isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    
    if ([productType isEqualToString:@"iPad5,1"]) return @"iPad Mini 4";
    if ([productType isEqualToString:@"iPad5,2"]) return @"iPad Mini 4";
    
    if ([productType isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if ([productType isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    
    if ([productType isEqualToString:@"iPad6,11"]) return @"iPad 5";
    if ([productType isEqualToString:@"iPad6,12"]) return @"iPad 5";
    
    if ([productType isEqualToString:@"iPad6,3"]) return @"iPad Pro(9.7)";
    if ([productType isEqualToString:@"iPad6,4"]) return @"iPad Pro(9.7)";
    
    if ([productType isEqualToString:@"iPad6,7"]) return @"iPad Pro(12.9)";
    if ([productType isEqualToString:@"iPad6,8"]) return @"iPad Pro(12.9)";
    
    if ([productType isEqualToString:@"i386"]) return @"iPhone Simulator";
    
    if ([productType isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    if (!productType) {
        productType = @"unknown";
    }
    
    return productType;
}

+ (NSUInteger)freeDiskSpace
{
    NSUInteger totalFreeSpace = 0;
    NSError *error = nil;
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error: &error];
    if (dictionary) {
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalFreeSpace = [freeFileSystemSizeInBytes unsignedIntegerValue];
    } else {
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], [error code]);
    }
    return totalFreeSpace;
}


@end
