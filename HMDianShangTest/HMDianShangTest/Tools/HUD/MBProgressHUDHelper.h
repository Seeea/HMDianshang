//
//  MBProgressHUDHelper.h
//  FinancePlatForm
//
//  Created by 刘鹤宫 on 14-3-3.
//  Copyright (c) 2014年 liuhegong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBProgressHUDHelper : UIBarButtonItem
+ (void)showHUD:(NSString *)msg delayTime:(NSTimeInterval)delayTime;
+ (void)removeHUD;
+(void)changeText;
+ (void) showToast:(NSString *)text delayTime:(NSTimeInterval) delayTime;


@end
