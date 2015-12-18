//
//  SecViewController.m
//  ADo_GuideView
//
//  Created by dwx on 15/5/1.
//  Copyright (c) 2015年 Nododo. All rights reserved.
//

#import "ADo_SecViewController.h"

@interface ADo_SecViewController ()

@end

@implementation ADo_SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页面";
    self.navigationController.navigationBarHidden = NO;
    [self configNav];
    self.view.backgroundColor = [UIColor redColor];
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backView.image = [UIImage imageNamed:@"Default"];
    [self.view addSubview:backView];
}
// 导航上返回按钮
- (void)configNav
{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backButtonItemClick)];
    self.navigationItem.leftBarButtonItem = buttonItem;
}
- (void)backButtonItemClick
{
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
