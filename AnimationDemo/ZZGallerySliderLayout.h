//
//  customLayout.h
//  newCollectionView
//
//  Created by b5m on 15-12-16.
//  Copyright (c) 2015年 b5m. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZZGallerySliderLayoutDelegate <NSObject>

@optional

-(void)setEffectOfHead:(CGFloat)offsetY;

@end

@interface ZZGallerySliderLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<ZZGallerySliderLayoutDelegate> delegate;

-(void)setContentSize:(NSUInteger)count;
@end
