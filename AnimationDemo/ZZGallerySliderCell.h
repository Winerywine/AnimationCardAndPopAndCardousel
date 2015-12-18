//
//  Cell.h
//  newCollectionView
//
//  Created by b5m on 15-12-16.
//  Copyright (c) 2015年 b5m. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZZGallerySliderCellDelegate <NSObject>

@optional

-(void)switchNavigator:(NSUInteger)tag;

@end
@interface ZZGallerySliderCell : UICollectionViewCell
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UIView *maskView;
@property(nonatomic, strong) UILabel *title;
@property(nonatomic, strong) UIView *desc;
@property (nonatomic,strong) UILabel *titleLabel;

-(void)setNameLabel:(NSString *)string;
-(void)setDescLabel:(NSString *)string;
-(void)setIndex:(NSUInteger)index;
-(void)revisePositionAtFirstCell;
-(void)reset;

@property (nonatomic, weak) id<ZZGallerySliderCellDelegate> delegate;
@end
