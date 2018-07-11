//
//  MINISO_Contact_View.m
//  MINISOApp
//
//  Created by LJ on 2018/7/6.
//  Copyright © 2018年 Ebenchen. All rights reserved.
//

#import "MINISO_Contact_View.h"

@implementation MINISO_Contact_View

- (IBAction)clickBtnAction:(id)sender {
    
    
}

+(MINISO_Contact_View *)instanceView {
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"MINISO_Contact_View" owner:nil options:nil];
    
    return [nibView objectAtIndex:0];
}

@end
