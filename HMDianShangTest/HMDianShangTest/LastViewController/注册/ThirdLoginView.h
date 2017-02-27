//
//  ThirdLoginView.h
//  HMDianShangTest
//
//  Created by Seeea on 17/2/27.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^qqLandingMethodBlock) ();
@interface ThirdLoginView : UIView
@property (copy,nonatomic)qqLandingMethodBlock qqBlock;
@end
