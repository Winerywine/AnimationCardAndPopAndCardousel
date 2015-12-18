//
//  JGDayViewController.m
//  AnimationDemo
//
//  Created by jgCho on 15/12/9.
//  Copyright © 2015年 com.b5m. All rights reserved.
//

#import "JGDayViewController.h"
#import "JGDayDetailViewController.h"
@interface JGDayViewController () <YQSweepCardViewDataSource,SweepCardViewDelegate>
{
    UILabel *showCountLabel;
}
@end

@implementation JGDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"每日好店";
    self.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.9];
    self.rowArray = [NSMutableArray arrayWithObjects:@"111",@"222",@"333",@"444",@"555",@"666", nil];
    
    [self.cardView registerNib:[UINib nibWithNibName:@"MyCard" bundle:nil] forItemReuseIdentifier:@"B"];
    self.cardView.delegate = self;
    self.cardView.dataSource = self;
    self.cardView.itemCount = 6;
    [self.cardView reloadData];
    [self configShowCountLabel];
}
/**
 *  显示指示条
 */
- (void)configShowCountLabel
{
    showCountLabel = [[UILabel alloc]init];
    showCountLabel.bounds = CGRectMake(0, 0, 100, 100);
    showCountLabel.center = CGPointMake(KWIDTH / 2, 80);
    showCountLabel.backgroundColor = [UIColor cyanColor];
    showCountLabel.text = [NSString stringWithFormat:@"1/6"];
    showCountLabel.textAlignment = NSTextAlignmentCenter;
    showCountLabel.clipsToBounds = YES;
    showCountLabel.layer.cornerRadius = 50;
    [self.view addSubview:showCountLabel];
    
}
#pragma mark -SweepCardViewDelegate
- (void)SweepCardView: (YQSweepCardView *)sweepCardView updateLabel:(int)index
{
    showCountLabel.text = [NSString stringWithFormat:@"%d/%lu",index,(unsigned long)_rowArray.count];
}
#pragma mark -YQSweepCardViewDataSource
- (YQSweepCardItem *)sweepCardView:(YQSweepCardView *)sweepCardView itemForIndex:(NSInteger)index
{
    YQSweepCardItem *item = [sweepCardView dequeueReusableItemWithIdentifier:@"B"];
    item.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    item.layer.cornerRadius = 5.0f;
    item.clipsToBounds = YES;
    if (item != nil) {
        CGRect rect = item.frame;
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
//        [button setBackgroundImage:[UIImage imageNamed:[_rowArray objectAtIndex:index]] forState:UIControlStateNormal];
//        button.tag = index;
//        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [item addSubview:button];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
        imgView.image = [UIImage imageNamed:[_rowArray objectAtIndex:index]];
//        imgView.userInteractionEnabled = YES;
        UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
        imgView.userInteractionEnabled = YES;
        [imgView addGestureRecognizer:gesture];
        [item addSubview:imgView];

    }
    return item;
}
#pragma mark -tapClick
- (void)tapClick
{
    JGDayDetailViewController *detailVC = [[JGDayDetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    detailVC.index = [showCountLabel.text intValue];
    [self.navigationController pushViewController:detailVC animated:YES];
}
//#pragma mark -buttonClick
//- (void)buttonClick: (UIButton *)button
//{
//    NSLog(@"点击了第%ld张",(long)button.tag);
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
