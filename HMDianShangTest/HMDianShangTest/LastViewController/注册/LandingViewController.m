//
//  LandingViewController.m
//  HMDianShangTest
//
//  Created by Seeea on 17/2/26.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import "LandingViewController.h"
#import "LandingView.h"
#import "ThirdLoginView.h"
#import "NextLandingViewController.h"
@interface LandingViewController ()
@property (nonatomic,strong) LandingView *landingView;
@property (nonatomic,strong) ThirdLoginView *thridLoginView;
@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MainColor;
    self.title = @"注册";
    [self.view addSubview:self.landingView];
    [self.view addSubview:self.thridLoginView];
    __weak typeof (self) weakSelf = self;
    [_landingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@230);
        make.left.right.top.equalTo(weakSelf.view);
    }];
    
    [_thridLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.landingView.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@85);
    }];

}

-(LandingView *)landingView{
    if (!_landingView) {
        _landingView = [[LandingView alloc]init];
        __weak typeof(self) weakself = self;
        _landingView.nextBlock = ^(NSDictionary *dic){
            NextLandingViewController *nextCtr = [[NextLandingViewController alloc]init];
            nextCtr.userMessageDic = dic;
            [weakself.navigationController pushViewController:nextCtr animated:YES];

        };
    }
    return _landingView;
}
-(ThirdLoginView *)ThridLoginView{
    if (_thridLoginView) {
        _thridLoginView = [[ThirdLoginView alloc]init];
        __weak typeof (self) weakSelf = self;
        _thridLoginView.qqBlock = ^(){
            [weakSelf qqLandingMethod];

        };

    }
    return _thridLoginView;
}

- (void)qqLandingMethod{
    NSLog(@"qq。。。。");
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
