//
//  ColorConvertUtil.h
//  SmartLifeIOSClient
//
//  Created by 王恩茂 on 14-10-16.
//  Copyright (c) 2014年 xinxinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ColorConvertUtil : NSObject
 
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
@end
