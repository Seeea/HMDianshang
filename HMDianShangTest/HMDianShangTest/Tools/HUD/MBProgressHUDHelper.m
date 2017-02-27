//
//  MBProgressHUDHelper.m
//  FinancePlatForm
//
//  Created by 刘鹤宫 on 14-3-3.
//  Copyright (c) 2014年 liuhegong. All rights reserved.
//

#import "MBProgressHUDHelper.h"
#import "MBProgressHUD.h"

@implementation MBProgressHUDHelper

static MBProgressHUD *HUD;
//MBProgressHUD 的使用方式，只对外两个方法，可以随时使用(但会有警告！)，其中窗口的 alpha 值 可以在源程序里修改。
+ (void)showHUD:(NSString *)msg delayTime:(NSTimeInterval)delayTime {
	HUD = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
	[[UIApplication sharedApplication].keyWindow addSubview:HUD];
    HUD.dimBackground = YES;
	HUD.labelText = msg;
	[HUD show:YES];
}
//给延迟时间后自动消失
+ (void)showToast:(NSString *)text delayTime:(NSTimeInterval)delayTime {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}
+ (void)removeHUD{
	
	[HUD hide:YES];
	[HUD removeFromSuperview];
    HUD= nil;
}

+(void)changeText
{
    HUD.mode = MBProgressHUDModeText;
	HUD.labelText = @"Some message...";
}

@end
