//
//  JGiCarouselCViewController.m
//  AnimationDemo
//
//  Created by jgCho on 15/12/16.
//  Copyright © 2015年 com.b5m. All rights reserved.
//

#import "JGiCarouselCViewController.h"

@interface JGiCarouselCViewController () <iCarouselDataSource,iCarouselDelegate>

@end

@implementation JGiCarouselCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"旋转木马";
    self.view.backgroundColor = [UIColor blackColor];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(switchCarouselType)];
    self.navigationItem.rightBarButtonItem = buttonItem;
    // 初始化
    _carousel=[[iCarousel alloc] initWithFrame:CGRectMake(0, 150, 320, 300)];
    _carousel.type=iCarouselTypeCylinder;
    _carousel.delegate=self;
    _carousel.dataSource=self;
    
    [self.view addSubview:_carousel];
}
- (void)switchCarouselType
{
    Flag =! Flag;
    if (Flag) {
        _carousel.type = iCarouselTypeCylinder;
    }else
    {
        _carousel.type = iCarouselTypeCoverFlow;
    }
}
#pragma mark -iCarouselDataSource,iCarouselDelegate
//有多少项
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 11;
}
//最大有多少个可以显示
- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel{
    return 21;
}
//每一个的内容
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index{
    UIImageView *imgv=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 210, 300)];
    imgv.image=[UIImage imageNamed:[NSString stringWithFormat:@"a%lu.jpg", (unsigned long)index]];
    return imgv;
}

-(CGFloat)carouselItemWidth:(iCarousel *)carousel{
    return 230;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"---->%ld", (long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
