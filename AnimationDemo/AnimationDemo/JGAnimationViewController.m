//
//  JGAnimationViewController.m
//  AnimationDemo
//
//  Created by jgCho on 15/12/9.
//  Copyright © 2015年 com.b5m. All rights reserved.
//

#import "JGAnimationViewController.h"
#import "JGCoreAnimationViewController.h"
#import "JGiCarouselCViewController.h"
#import "JGGuideViewController.h"
@interface JGAnimationViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation JGAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"核心动画";
    self.tableView.frame = self.view.bounds;
    self.rowArray = [NSMutableArray arrayWithObjects:@"转场动画CATransition",@"事务动画CATransaction",@"基础动画CABasicAnimation",@"关键帧动画CAKeyframeAnimation",@"动画组CAAnimationGroup",@"旋转木马iCarousel",@"旋转滑动引导页", nil];
}
#pragma mark -UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rowArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [_rowArray objectAtIndex:indexPath.row];
    return cell;
}
/**
 *  点击对应的单元格跳转到相应的动画界面
 *
 *  @param tableView 表
 *  @param indexPath 索引
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 5) {
        // 跳转到旋转木马动画界面
        JGiCarouselCViewController *carouselVC = [[JGiCarouselCViewController alloc]init];
        carouselVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:carouselVC animated:YES];
    }else if (indexPath.row == 6)
    {
        JGGuideViewController *guideVC = [[JGGuideViewController alloc]init];
        guideVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:guideVC animated:YES];
    }else
    {
        // 五种核心动画
        JGCoreAnimationViewController *coreAnimationVC = [[JGCoreAnimationViewController alloc]init];
        coreAnimationVC.hidesBottomBarWhenPushed = YES;
        coreAnimationVC.animationType = (int)indexPath.row;
        [self.navigationController pushViewController:coreAnimationVC animated:YES];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
