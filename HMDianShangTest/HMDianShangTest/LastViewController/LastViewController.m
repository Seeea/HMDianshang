//
//  LastViewController.m
//  HMDianShangTest
//
//  Created by Seeea on 17/2/23.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import "LastViewController.h"
#import "MyHeaderView.h"
#import "MyTableView.h"
#import "LandingViewController.h"
@interface LastViewController ()
@property (nonatomic,strong)MyHeaderView *headView;
@property (nonatomic,strong)MyTableView *myTableView;
@end

@implementation LastViewController
#pragma mark - 懒加载
-(UIView *)headView{
    if (!_headView) {
        _headView = [[MyHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 160)];
        __weak typeof(self) weakself = self;
        _headView.landingBlock = ^(){
            LandingViewController *landingView = [[LandingViewController alloc]init];
            [weakself.navigationController pushViewController:landingView animated:YES];
        };
        _headView.loginBlock = ^(){
            HMLog(@"登录");
        };
        
    }
    return _headView;
}
-(MyTableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[MyTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        __weak typeof (self) weakSelf = self;
        _myTableView.exitBlock = ^(){
            [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"ISLOGIN"];
            [weakSelf.myTableView reloadData];
            [weakSelf.headView reloadHeadView];
        };

        _myTableView.tableHeaderView = self.headView;
    }
    return _myTableView;
}
#pragma mark - 视图布局
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = RGB(242, 242, 242);
    [self.view addSubview:self.myTableView];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_myTableView reloadData];
    [_headView reloadHeadView];
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
