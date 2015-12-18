//
//  JGAnimationViewController.h
//  AnimationDemo
//
//  Created by jgCho on 15/12/9.
//  Copyright © 2015年 com.b5m. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGAnimationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *rowArray;
@end
