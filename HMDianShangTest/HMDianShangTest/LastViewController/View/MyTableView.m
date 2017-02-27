//
//  MyTableView.m
//  HMDianShangTest
//
//  Created by Seeea on 17/2/24.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import "MyTableView.h"
#import "MyTableViewCell.h"
#import "MyHeaderView.h"

@interface MyTableView()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)   NSArray *messageTableSource;              /** message列表需要展示的数据源 */



@end

@implementation MyTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.backgroundColor = RGB(242, 242, 242);
    }
    return self;

}
- (NSArray *)messageTableSource{
    if (!_messageTableSource) {
        _messageTableSource = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SXTMyMessageTablePlist" ofType:@"plist"]];
    }
    return _messageTableSource;
}

#pragma mark - 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *loginDic = [[NSUserDefaults standardUserDefaults]valueForKey:@"ISLOGIN"];
    if (loginDic.count) {
        return 6;
    }else
        return 4;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.sourceDic = self.messageTableSource[indexPath.row];
    if (indexPath.row == 3) {
        UIImageView *nextImage = [cell valueForKey:@"nextImage"];
        nextImage.hidden = YES;
        
        UILabel *phoneNum = [[UILabel alloc]init];
        phoneNum.textColor = RGB(123, 124, 128);
        phoneNum.text = @"400-100-1111";
        [cell addSubview:phoneNum];
        
        __weak typeof (cell) weakSelf = cell;
        [phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.mas_right).offset(-15);
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(110, 15));
        }];
    }
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NSDictionary *loginDic = [[NSUserDefaults standardUserDefaults]valueForKey:@"ISLOGIN"];
    if (loginDic.count){
        UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        footView.backgroundColor = MainColor;
        UIButton *exitBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        exitBtn.frame = CGRectMake(50, 42, kScreenWidth-100, 45);
        [exitBtn addTarget:self action:@selector(exitBtnMethod) forControlEvents:(UIControlEventTouchUpInside)];
        [exitBtn setImage:[UIImage imageNamed:@"我的界面退出登录按钮"] forState:(UIControlStateNormal)];
        [footView addSubview:exitBtn];
        return footView;
    }
    return nil;
}

- (void)exitBtnMethod{
    if (_exitBlock) {
        _exitBlock();
    }
}

@end
