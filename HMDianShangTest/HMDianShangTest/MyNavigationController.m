//
//  MyNavigationController.m
//  HMDianShangTest
//
//  Created by Seeea on 17/2/23.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"mask_titlebar.png"];
    CGImageRef cgImage = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, 0, kScreenWidth, kNavigationHeight));
    [self.navigationBar setBackgroundImage:[UIImage imageWithCGImage:cgImage] forBarMetrics:UIBarMetricsDefault];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
