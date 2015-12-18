//
//  JGCoreAnimationViewController.h
//  AnimationDemo
//
//  Created by jgCho on 15/12/11.
//  Copyright © 2015年 com.b5m. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGCoreAnimationViewController : UIViewController
@property (nonatomic,unsafe_unretained) int animationType;// 动画类型
@property (nonatomic,strong) NSMutableArray *titleArray;// 标题数组
@end
