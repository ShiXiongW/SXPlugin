//
//  UIColor+WColor.m
//  TopiOSBaseLib
//
//  Created by wangshixiong on 2020/6/23.
//  Copyright © 2020 WSX. All rights reserved.
//

#import "UIColor+WColor.h"

@implementation UIColor (WColor)

+ (UIColor *)hexColorWith:(NSString *)hexStr
{
    if (hexStr.length < 6) {
        return [UIColor clearColor];
    }
    
    long rValue = strtoul([hexStr substringWithRange:NSMakeRange(0, 2)].UTF8String, 0, 16);
    long gValue = strtoul([hexStr substringWithRange:NSMakeRange(2, 2)].UTF8String, 0, 16);
    long bValue = strtoul([hexStr substringWithRange:NSMakeRange(4, 2)].UTF8String, 0, 16);
    
    return [UIColor colorWithRed:rValue/ 255.0 green:gValue / 255.0 blue:bValue / 255.0 alpha:1.0];
}

@end
