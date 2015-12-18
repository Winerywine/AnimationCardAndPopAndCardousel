//
//  JGPeaViewController.m
//  AnimationDemo
//
//  Created by jgCho on 15/12/9.
//  Copyright © 2015年 com.b5m. All rights reserved.
//

#import "JGPeaViewController.h"
#import "macro.h"
#import "ZZGallerySliderCell.h"
#import "ZZGallerySliderLayout.h"
#import "XWPresentedOneController.h"
#import "Masonry.h"
#import "XWInteractiveTransition.h"
#import "XWPresentOneTransition.h"

@interface JGPeaViewController () <UICollectionViewDataSource,UICollectionViewDelegate,ZZGallerySliderCellDelegate,XWPresentedOneControllerDelegate>
{
    UICollectionView *galleryCollectionView;
}
@property (nonatomic, strong) XWInteractiveTransition *interactivePush;
@end

@implementation JGPeaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"豌豆公主";
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self initData];
    [self initCollectionView];
    _interactivePush = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypePresent GestureDirection:XWInteractiveTransitionGestureDirectionUp];
    typeof(self)weakSelf = self;
    _interactivePush.presentConifg = ^(){
        [weakSelf present];
    };
    
    
    [_interactivePush addPanGestureForViewController:self.navigationController];
}
/**
 *  初始化数据
 */
- (void)initData
{
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 20; i ++) {
        [self.dataArray addObject:@"background.jpg"];
    }
}
/**
 *  初始化表视图
 */
- (void)initCollectionView
{
    ZZGallerySliderLayout *layout = [[ZZGallerySliderLayout alloc] init];
    [layout setContentSize:20];
    galleryCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CELL_WIDTH, (CGRectGetHeight([UIScreen mainScreen].bounds) )) collectionViewLayout:layout];
    [galleryCollectionView registerClass:[ZZGallerySliderCell class] forCellWithReuseIdentifier:@"CELL"];
    galleryCollectionView.dataSource = self;
    galleryCollectionView.delegate = self;
    [self.view addSubview:galleryCollectionView];
    
}
#pragma mark -UICollectionViewDataSource,UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count + 1;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return CGSizeMake(CELL_WIDTH, HEADER_HEIGHT);
    }else if(indexPath.row == 1){
        return CGSizeMake(CELL_WIDTH, CELL_CURRHEIGHT);
    }else{
        return CGSizeMake(CELL_WIDTH, CELL_HEIGHT);
    }
}
/**
 *  支持设备旋转
 *
 *  @param toInterfaceOrientation 方向
 *
 *  @return 旋转方向
 */
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZZGallerySliderCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.delegate = self;
    cell.tag = indexPath.row;
    [cell setIndex:indexPath.row];
    [cell reset];
    
    if(indexPath.row == 0){
        cell.imageView.image = nil;
        
    }else{
        if(indexPath.row == 1){
            [cell revisePositionAtFirstCell];
        }
        
        [cell setNameLabel:@"健康牙齿第一步"];
//        [cell setDescLabel:@"Jun.K"];
        
        UIImage *image = [UIImage imageNamed:[_dataArray objectAtIndex:indexPath.row-1]];
        cell.imageView.image = image;
    }
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了单元格");
    [self present];
}

/**
 *  模态到宝贝详情界面
 */
- (void)present{
    XWPresentedOneController *presentedVC = [XWPresentedOneController new];
    presentedVC.delegate = self;
    [self presentViewController:presentedVC animated:YES completion:nil];
}

- (void)presentedOneControllerPressedDissmiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent{
    return _interactivePush;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
