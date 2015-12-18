//
//  JGDayDetailViewController.m
//  AnimationDemo
//
//  Created by jgCho on 15/12/16.
//  Copyright © 2015年 com.b5m. All rights reserved.
//

#import "JGDayDetailViewController.h"

@interface JGDayDetailViewController ()

@end

@implementation JGDayDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"第%d家店",_index];
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
