//
//  LoginViewController.m
//  HMDianShangTest
//
//  Created by Seeea on 17/2/27.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "ThirdLoginView.h"
@interface LoginViewController ()
@property(nonatomic,strong)LoginView *loginView;
@property(nonatomic,strong)ThirdLoginView *thirdLoginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    self.edgesForExtendedLayout = 0;
    [self addController];

}
- (void)addController{
    [self.view addSubview:self.loginView];
    [self.view addSubview:self.thirdLoginView];
    
    __weak typeof (self) weakSelf = self;
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@200);
    }];
    
    [_thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginView.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@85);
    }];
    
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
