//
//  MyTabbarController.m
//  HMDianShangTest
//
//  Created by Seeea on 17/2/23.
//  Copyright © 2017年 Seeea. All rights reserved.
//

#import "MyTabbarController.h"

#import "MyNavigationController.h"
@interface MyTabbarController ()
@property(nonatomic,strong)UIImageView *themeImageView;
@property(nonatomic,strong)UIImageView *tabbarbackImage;
@end

@implementation MyTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSubviewControllers];
    
    
}
//视图将要布局
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [self removeItem];
    
    [self createItem];
    
}

- (void)removeItem{
    
    for (UIView *view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
}

- (void)createItem{
    _tabbarbackImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight)];
    _tabbarbackImage.image = [UIImage imageNamed:@"mask_navbar"];
    _tabbarbackImage.userInteractionEnabled=YES;
    [self.tabBar addSubview:_tabbarbackImage];
    //  2.创建点击按钮
    NSArray *buttonNames = @[
                             @"home_tab_icon_1",
                             @"home_tab_icon_2",
                             @"home_tab_icon_3",
                             @"home_tab_icon_4"
                             ];
    
    CGFloat buttonWidth = kScreenWidth/buttonNames.count;
    for (int i = 0; i < buttonNames.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*buttonWidth, 0, buttonWidth, kTabbarHeight);
        [button setImage:[UIImage imageNamed:buttonNames[i]] forState:UIControlStateNormal];
        button.tag=1000+i;
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tabbarbackImage addSubview:button];
        
    }
    
}
-(void) creatSubviewControllers{
    HomeViewController *homeCtr = [[HomeViewController alloc]init];
    SecondViewController *secondCtr = [[SecondViewController alloc]init];
    ThirdViewController *thirdCtr = [[ThirdViewController alloc]init];
//    LastTableViewController *LastCtr = [[LastTableViewController alloc]init];
    LastViewController *lastCtr = [[LastViewController alloc]init];
    
    MyNavigationController *navC1 = [[MyNavigationController alloc]initWithRootViewController:homeCtr];
    MyNavigationController *navC2 = [[MyNavigationController alloc]initWithRootViewController:secondCtr];
    MyNavigationController *navC3 = [[MyNavigationController alloc]initWithRootViewController:thirdCtr];
    MyNavigationController *navC4 = [[MyNavigationController alloc]initWithRootViewController:lastCtr];
    
    NSArray *navigationArr = [NSArray arrayWithObjects:navC1,navC2,navC3,navC4, nil];
    self.viewControllers = navigationArr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buttonAction:(UIButton *)btn{
    
    NSInteger index=btn.tag-1000;
    
    //  跳转到对应的子控制器
    [self setSelectedIndex:index];
    
}
@end
