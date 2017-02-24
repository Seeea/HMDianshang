//
//  MyTableView.h
//  HMDianShangTest
//
//  Created by Seeea on 17/2/24.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^exitBtnMethodBlock)();

@interface MyTableView : UITableView
@property (copy, nonatomic) exitBtnMethodBlock exitBlock;


@end
