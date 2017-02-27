//
//  LandingView.h
//  HMDianShangTest
//
//  Created by Seeea on 17/2/27.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^nextViewControllerBlock)(NSDictionary *dic);
@interface LandingView : UIView
@property (copy,nonatomic)nextViewControllerBlock nextBlock;//去往下个页面回调的block
@end
