//
//  NSString+MINISOExtensions.m
//  MINISOApp
//
//  Created by Eben chen on 2018/6/27.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "NSString+MINISOExtensions.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (MINISOExtensions)

- (NSString *) MD5 {
    const char * cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (BOOL)isBlankString {
    
    if (!self || [self isKindOfClass:[NSNull class]] || [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
}

- (NSString *)urlEncodedString {
    CFStringRef encodedCFString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self, NULL, CFSTR("?!@#$^&%*+,:;='\"`<>()[]{}/\\| "), kCFStringEncodingUTF8);
    
    NSString *encodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString *) encodedCFString];
    
    return encodedString;
}

- (BOOL)isContainsEnglishCharacter {
    if (!self.length) {
        return NO;
    }
    NSString *pattern = @"[A-Za-z]";
    NSRegularExpression *regularExpression = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:NULL];
    NSArray *allResults = [regularExpression matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    return allResults.count;

}

@end
