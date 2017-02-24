//
//  MyHeaderView.h
//  HMDianShangTest
//
//  Created by Seeea on 17/2/24.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^LandingButtonBlock)();
typedef void(^loginButtonBlock) ();
@interface MyHeaderView : UIView
@property (copy,nonatomic) LandingButtonBlock landingBlock;
@property (copy,nonatomic) loginButtonBlock loginBlock;
- (void)reloadHeadView;

@end
