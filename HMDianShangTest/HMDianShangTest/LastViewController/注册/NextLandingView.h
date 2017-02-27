//
//  NextLandingView.h
//  HMDianShangTest
//
//  Created by Seeea on 17/2/27.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^landingBtnBlock)(NSString *code);

@interface NextLandingView : UIView
@property (copy, nonatomic) landingBtnBlock landingBlock;//注册按钮回调block
@property (copy, nonatomic) NSString *phoneNumString;//记录手机号
- (void)GCDTime;

@end
