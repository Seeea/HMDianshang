//
//  NextLandingViewController.m
//  HMDianShangTest
//
//  Created by Seeea on 17/2/27.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import "NextLandingViewController.h"
#import "NextLandingView.h"
@interface NextLandingViewController ()
@property (nonatomic,strong) NextLandingView *nextLandingView;
@end

@implementation NextLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"验证手机号";
    self.edgesForExtendedLayout = 0;
    
    HMLog(@"用户名和密码是:%@",_userMessageDic);
    [self addController];
    [self requestCodeNumber];

}
//加载控件mvc  mvvm
- (void)addController{
    [self.view addSubview:self.nextLandingView];
    __weak typeof (self) weakSelf = self;
    [_nextLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@140);
    }];
}
//请求验证码
- (void)requestCodeNumber{
    [HttpExtension postWithURLString:@"appMember/createCode.do" parameters:@{@"MemberId":_userMessageDic[@"userName"]} success:^(NSDictionary *data) {
        HMLog(@"success:%@",data);
        if ([data[@"result"] isEqualToString:@"success"]) {
            [self.nextLandingView GCDTime];
        }else if ([data[@"result"] isEqualToString:@"TelephoneExistError"]){
            [MBProgressHUDHelper showHUD:@"手机号已经被注册" delayTime:1.5];
        }else{
            
            [MBProgressHUDHelper showHUD:@"验证码请求失败" delayTime:1.5];

        }

    } failure:^(NSError *error) {
        HMLog(@"error:%@",error);
    }];
     
}

//注册方法
- (void)LandingMethod:(NSString *)code{
    [HttpExtension getWithURLString:@"appMember/appRegistration.do" parameters:@{@"LoginName":_userMessageDic[@"userName"],
        @"Lpassword":_userMessageDic[@"password"],
        @"Code":code,
        @"Telephone":_userMessageDic[@"userName"]}
                            success:^(NSDictionary *data) {
            if ([data[@"result"]isEqualToString:@"success"]) {
                [MBProgressHUDHelper showToast:@"注册成功" delayTime:1.5];
                [self autoLogin];
            }else if ([data[@"result"]isEqualToString:@"codeError"]){
                [MBProgressHUDHelper showToast:@"验证码错误" delayTime:1.5];
            }else{
                [MBProgressHUDHelper showToast:@"注册失败" delayTime:1.5];
            }
                                HMLog(@"data:%@",data);
                            } failure:^(NSError *error) {
                                HMLog(@"error:%@",error);
                            }];
    
}
- (NextLandingView *)nextLandingView{
    if (!_nextLandingView) {
        _nextLandingView = [[NextLandingView alloc]init];
        _nextLandingView.phoneNumString = _userMessageDic[@"userName"];
        __weak typeof (self) weakSelf = self;
        _nextLandingView.landingBlock = ^(NSString *code){
            [weakSelf LandingMethod:code];
        };
    }
    return _nextLandingView;
}
//登录方法
- (void)autoLogin{
    [HttpExtension getWithURLString:@"appMember/appLogin.do" parameters:@{@"LoginName":_userMessageDic[@"userName"],@"Lpassword":_userMessageDic[@"password"]} success:^(NSDictionary *data) {
        HMLog(@"data:%@",data);
        if ([data[@"result"]isEqualToString:@"0"]) {
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"ISLOGIN"];
            [self performSelector:@selector(popMyViewController) withObject:nil afterDelay:1.0];
        }
    } failure:^(NSError *error) {
        HMLog(@"error : %@",error);
    }];
   }

- (void)popMyViewController{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
