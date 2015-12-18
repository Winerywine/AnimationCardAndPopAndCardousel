//
//  JGCoreAnimationViewController.m
//  AnimationDemo
//
//  Created by jgCho on 15/12/11.
//  Copyright © 2015年 com.b5m. All rights reserved.
//

#import "JGCoreAnimationViewController.h"

@interface JGCoreAnimationViewController ()
{
    UIImageView *basicImg;
    UIButton *basicBtn;
    UIImageView *groupImg;
    CALayer *keyLayer;
    UIButton *keyBtn;
    CALayer *transactionLayer;
    UIButton *transactionButton;
}
@end

@implementation JGCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.titleArray = [NSMutableArray arrayWithObjects:@"转场动画",@"事务动画",@"基础动画",@"关键帧动画",@"动画组动画", nil];
    self.title = [_titleArray objectAtIndex:_animationType];
    // 配置做动画的UI控件
    [self configAnimationUI];
}
#pragma mark -配置做动画的UI控件
- (void)configAnimationUI
{
    switch (self.animationType) {
        case 0:
        {
            // 转场动画
            [self configTransitionUI];
        }
            break;
        case 1:
        {
            // 事务动画
            [self configTransactionUI];
        }
            break;
        case 2:
        {
            // 基础动画
            [self configBasicAnimationUI];
        }
            break;
        case 3:
        {
            // 关键帧动画
            [self configKeyframeAnimationUI];
        }
            break;
        case 4:
        {
            // 动画组
            [self configAnimationGroupUI];
        }
            break;
        default:
            break;
    }
}
- (IBAction)buttonClick:(UIButton *)sender
{
    [self doAnimation];
}

- (void)doAnimation
{
    switch (self.animationType) {
        case 0:
        {
            // 转场动画
            [self doCATransition];
        }
            break;
        case 1:
        {
            // 事务动画
            [self doCATransaction];
        }
            break;
        case 2:
        {
            // 基础动画
            [self doBasicAnimationWithImg:basicImg button:basicBtn];
        }
            break;
        case 3:
        {
            // 关键帧动画
            [self doKeyframeAnimation];
        }
            break;
        case 4:
        {
            // 动画组
            [self doAnimationGroup];
        }
            break;
        default:
            break;
    }
}
#pragma mark -转场动画的UI控件
- (void)configTransitionUI
{
    // 创建一个button并设置layer
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame= CGRectMake(100, 150, 100, 100);
    button.backgroundColor = [UIColor whiteColor];
    // 设置图层的一些属性
    button.layer.cornerRadius = 50;
    button.layer.borderColor = [UIColor yellowColor].CGColor;
    button.layer.borderWidth = 5;
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 1;
    button.layer.shadowOffset = CGSizeMake(5, 10);
    button.layer.shadowRadius = 5;
    [self.view addSubview:button];
    //创建一个图层,用于动画
    CALayer *layer = [[CALayer alloc]init];
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    layer.frame = CGRectMake(0, 0, KWIDTH, KHEIGHT);
}
/**
 *  转场动画
 */
- (void)doCATransition
{
    // 转场动画
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.type = @"rippleEffect";
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [self.view.layer addAnimation:transition forKey:@"1"];
}
- (void)configTransactionUI
{
    transactionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    transactionButton.frame = CGRectMake(100, 150, 100, 100);
    //    button.backgroundColor = [UIColor purpleColor];
    transactionButton.backgroundColor = [UIColor whiteColor];
    // 所以的UIView   内部都有一个layer,  我们所看到的view的外形,  都是layer所显示的
    // 按钮内部图层的圆角
    transactionButton.layer.cornerRadius = 50;
    //    button.clipsToBounds = YES;
    // 边框
    transactionButton.layer.borderColor = [UIColor yellowColor].CGColor;
    transactionButton.layer.borderWidth = 5;
    // 阴影颜色 及透明度
    transactionButton.layer.shadowColor = [UIColor blackColor].CGColor;
    transactionButton.layer.shadowOpacity = 1;
    // 阴影偏移
    transactionButton.layer.shadowOffset = CGSizeMake(5, 10);
    transactionButton.layer.shadowRadius = 5;
    [self.view addSubview:transactionButton];
    // 自己创建一个图层
    transactionLayer = [[CALayer alloc]init];
    transactionLayer.frame = CGRectMake(100, 300, 100, 100);
    transactionLayer.backgroundColor = [UIColor whiteColor].CGColor;
    transactionLayer.cornerRadius = 50;
    [self.view.layer addSublayer:transactionLayer];
}
- (void)doCATransaction
{
    // 用在修改图层的一些属性上
    [CATransaction begin];
    [CATransaction setAnimationDuration:1];
    // 控制动画的速度
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:@"easeIn"]];
    //    _layer.frame = CGRectMake(100, 300, 100, 50);
    //    _layer.transform = CATransform3DMakeRotation(M_PI_2, 1, 1, 1);
    transactionLayer.transform = CATransform3DRotate(transactionLayer.transform, M_PI_2, 1, 1, 1);
    //    _layer.transform = CATransform3DScale(_layer.transform, 0.9, 0.9, 0.9);
    transactionLayer.transform = CATransform3DTranslate(transactionLayer.transform, 10, 10, 10);
    [CATransaction commit];
}
/**
 *  基础动画
 */
- (void)doBasicAnimationWithImg: (UIImageView *)imageView button: (UIButton *)button
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.3;
    animation.fromValue = @(0.5);
    animation.toValue = @(1.5);
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    [imageView.layer addAnimation:animation forKey:@"Basic"];
    [button.imageView.layer addAnimation:animation forKey:@"btn"];
}
/**
 *  配置基础动画的UI控件
 */
- (void)configBasicAnimationUI
{
    basicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    basicBtn.frame = CGRectMake(100, 150, 100, 100);
    basicBtn.backgroundColor = [UIColor whiteColor];
    basicBtn.backgroundColor = [UIColor clearColor];
    basicBtn.layer.shadowOffset = CGSizeMake(5, 10);
    basicBtn.layer.shadowRadius = 5;
    [basicBtn setImage:[UIImage imageNamed:@"33.png"] forState:UIControlStateNormal];
    [self.view addSubview:basicBtn];
    // 自己创建一个图层
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(100, 300, 100, 100);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    basicImg = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    basicImg.image = [UIImage imageNamed:@"22.jpg"];
    [self.view addSubview:basicImg];
}
#pragma mark -配置关键帧动画的UI控件
- (void)configKeyframeAnimationUI
{
    keyBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    keyBtn.frame = CGRectMake(100, 220, 80, 80);
    keyBtn.backgroundColor = [UIColor whiteColor];
    keyBtn.layer.cornerRadius = 40;
    // 边框
    keyBtn.layer.borderColor = [UIColor yellowColor].CGColor;
    keyBtn.layer.borderWidth = 5;
    // 阴影颜色 及透明度
    keyBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    keyBtn.layer.shadowOpacity = 1;
    // 阴影偏移
    keyBtn.layer.shadowOffset = CGSizeMake(5, 10);
    keyBtn.layer.shadowRadius = 5;
    [self.view addSubview:keyBtn];
}
- (void)doKeyframeAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.3;
    animation.keyTimes = @[@(0),@(0.33),@(0.67),@(1.0)];
    animation.values = @[@(0.6),@(1.3),@(0.9),@(1.0)];
    [keyBtn.layer addAnimation:animation forKey:@"keyframe"];
}
#pragma mark -配置动画组的UI控件
- (void)configAnimationGroupUI
{
    groupImg = [[UIImageView alloc]initWithFrame:CGRectMake(130, 80, 60, 60)];
    groupImg.image = [UIImage imageNamed:@"44.png"];
    [self.view addSubview:groupImg];
    groupImg.clipsToBounds = YES;
    groupImg.layer.cornerRadius = 30;
}
#pragma mark -做动画组动画
- (void)doAnimationGroup
{
    // basic
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    basicAnimation.duration = 0.2;
    basicAnimation.fromValue = @(0);
    basicAnimation.toValue = @(20 * M_PI);
    basicAnimation.repeatCount = MAXFLOAT;
    basicAnimation.repeatDuration = 2;
    [groupImg.layer addAnimation:basicAnimation forKey:@"basic"];
    //
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.duration = 3;
    moveAnimation.values = @[[NSValue valueWithCGPoint:CGPointMake(160, 50)],[NSValue valueWithCGPoint:CGPointMake(160, 568 - 49 - 30)],[NSValue valueWithCGPoint:CGPointMake(160, 568 - 49 - 30 - 200)],[NSValue valueWithCGPoint:CGPointMake(160, 568 - 49 - 30 )],[NSValue valueWithCGPoint:CGPointMake(160, 568 - 49 - 30 - 100)],[NSValue valueWithCGPoint:CGPointMake(160, 568 - 49 - 30)]];
    moveAnimation.keyTimes = @[@(0),@(0.2),@(0.4),@(0.6),@(0.8),@(1.0)];
    moveAnimation.fillMode = kCAFillModeForwards;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [groupImg.layer addAnimation:moveAnimation forKey:@"move"];
    // 大小
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 3;
    scaleAnimation.values = @[@(1),@(1.5),@(1.3),@(1.5),@(1.2),@(1)];
    scaleAnimation.keyTimes = @[@(0),@(0.2),@(0.4),@(0.6),@(0.8),@(1.0)];
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.fillMode = kCAFillModeForwards;
    [groupImg.layer addAnimation:scaleAnimation forKey:@"scale"];
    // 动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[basicAnimation,moveAnimation,scaleAnimation];
    group.duration = 3;
    [groupImg.layer addAnimation:group forKey:@"group"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
