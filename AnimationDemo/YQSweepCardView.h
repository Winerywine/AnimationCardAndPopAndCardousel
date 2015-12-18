//
//  YQSweepCardView.h
//  YQSweepCardView
//
//  Created by b5m on 15/12/14.
//  Copyright © 2015年 b5m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQSweepCardItem.h"
@class YQSweepCardView;

NS_ASSUME_NONNULL_BEGIN // 不为空

@protocol YQSweepCardViewDataSource <NSObject>

@required

- (YQSweepCardItem *)sweepCardView:(YQSweepCardView *)sweepCardView itemForIndex:(NSInteger)index;

@end
@protocol SweepCardViewDelegate <NSObject>

@required
// 检测当前屏幕显示的是第几张图片
- (void)SweepCardView: (YQSweepCardView *)sweepCardView updateLabel:(int)index;

@end

@interface YQSweepCardView :  UIView
{
    CGPoint _beginPoint;
    
}
#pragma mark optional
@property (nonatomic, assign) UIEdgeInsets contentInsets;
@property (nonatomic, assign) IBInspectable NSInteger stackCount;
/**
 *  为了让后边的item在视图上显示出边框，调节此值可能需要配合调节contentInsets的值
 */
@property (nonatomic, assign) IBInspectable CGFloat backItemOffset;
#pragma mark required
@property (nonatomic, weak) IBOutlet id<YQSweepCardViewDataSource> dataSource;
@property (nonatomic, assign) IBInspectable NSInteger itemCount;
@property (nonatomic,assign) id <SweepCardViewDelegate>delegate;
- (void)registerNib:(nullable UINib *)nib forItemReuseIdentifier:(NSString *)identifier;
- (void)registerClass:(nullable Class)itemClass forItemReuseIdentifier:(NSString *)identifier;
- (__kindof YQSweepCardItem *)dequeueReusableItemWithIdentifier:(NSString *)identifier;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END