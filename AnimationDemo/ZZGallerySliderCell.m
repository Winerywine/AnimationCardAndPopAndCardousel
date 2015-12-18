//
//  Cell.m
//  newCollectionView
//
//  Created by chester on 15-12-16.
//  Copyright (c) 2015年 b5m. All rights reserved.
//

#import "ZZGallerySliderCell.h"
#import "macro.h"
#define KSCREENWIDTH [UIScreen mainScreen].bounds.size.width
@interface ZZGallerySliderCell()
{
    BOOL hasLayout;
}

@property(nonatomic, strong) NSURL *currentBackURL;
@property(nonatomic) NSUInteger cellIndex;

@end

@implementation ZZGallerySliderCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        hasLayout = NO;
        self.clipsToBounds = YES;
        //根据当前CELL所在屏幕的不同位置，初始化IMAGEVIEW的相对位置，为了配合滚动时的IMAGEVIEW偏移动画
        //(screen_y-attributes.frame.origin.y)/568*80
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, IMAGEVIEW_ORIGIN_Y-self.frame.origin.y/568*IMAGEVIEW_MOVE_DISTANCE, CELL_WIDTH, SC_IMAGEVIEW_HEIGHT)];
        self.imageView.contentMode =  UIViewContentModeScaleAspectFill;
        [self addSubview:self.imageView];
        
        self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CELL_WIDTH, 250)];
        self.maskView.backgroundColor = [UIColor blackColor];
        self.maskView.alpha = 0.6;
        [self addSubview:self.maskView];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, (CELL_HEIGHT-TITLE_HEIGHT)/2 + 80, CELL_WIDTH, TITLE_HEIGHT)];
        self.title.textColor = [UIColor whiteColor];
        self.title.font = [UIFont systemFontOfSize:30];
        self.title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.title];
        self.contentMode = UIViewContentModeCenter;
        self.title.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
        self.title.center = self.contentView.center;
        [self.title setBackgroundColor:[UIColor clearColor]];
        
//        self.desc = [[UILabel alloc] initWithFrame:CGRectMake(0, (CELL_HEIGHT-TITLE_HEIGHT)/2+30, 300 , 0)];
        self.desc = [[UIView alloc]initWithFrame:CGRectMake(0, 130, KSCREENWIDTH , 60 + 50)];
//        self.desc.backgroundColor = [UIColor cyanColor];
        // 标题label
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, -35, KSCREENWIDTH, 50)];
        self.titleLabel.text = [NSString stringWithFormat:@"健康牙齿第一步"];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:30.0];
        [self.desc addSubview:self.titleLabel];
        // 添加ImageView
        UIImageView *userImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 65, 40, 40)];
        userImgView.image = [UIImage imageNamed:@"head.jpg"];
        userImgView.clipsToBounds = YES;
        userImgView.layer.cornerRadius = 20;
        [self.desc addSubview:userImgView];
        // 添加UserName
        UILabel *userLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 110 - 40, 80, 40)];
        userLabel.text = @"Alice";
        userLabel.textColor = [UIColor whiteColor];
        [self.desc addSubview:userLabel];
        // likeLabel
        UILabel *LikeLabel = [[UILabel alloc]initWithFrame:CGRectMake(KSCREENWIDTH - 60, 110 - 40, 80, 40)];
        LikeLabel.text = [NSString stringWithFormat:@"%d",1895];
        [self.desc addSubview:LikeLabel];
        // likeImgView
        UIImageView *likeImgView = [[UIImageView alloc]initWithFrame:CGRectMake(KSCREENWIDTH - 100, 115 - 40, 30, 30)];
        likeImgView.image = [UIImage imageNamed:@"see.png"];
        [self.desc addSubview:likeImgView];
        [self addSubview:self.desc];
        [self addSubview:self.desc];
        }
    return self;
}
/**
 *  检查第一个单元格
 */
-(void)revisePositionAtFirstCell
{
    if(self.tag == 1){
        self.title.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.desc.alpha = 0.85;
        self.title.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, self.contentView.center.y + 70);
//        self.title.center = self.contentView.center;
        self.titleLabel.text = @"";
    }else
    {
        self.titleLabel.text = @"健康牙齿第一步";
    }
}
/**
 *  重写set方法,设置背景色
 *
 *  @param index 单元格索引
 */
-(void)setIndex:(NSUInteger)index
{
    
    self.cellIndex = index;
    if (self.cellIndex == 0) {
        self.maskView.alpha = 0;
        self.backgroundColor = [UIColor lightGrayColor];
    }else if(self.cellIndex == 1){
        self.maskView.alpha = 0.2;
        self.backgroundColor = [UIColor blackColor];
    }else{
        self.maskView.alpha = 0.6;
        self.backgroundColor = [UIColor blackColor];
    }
    [self setImageViewPostion];
}
/**
 *  背景图片位置
 */
-(void)setImageViewPostion
{
    if (self.imageView) {
        self.imageView.frame = CGRectMake(0, IMAGEVIEW_ORIGIN_Y-self.frame.origin.y/568*IMAGEVIEW_MOVE_DISTANCE, CELL_WIDTH, SC_IMAGEVIEW_HEIGHT);
    }
}

-(void)setNameLabel:(NSString *)string
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    self.title.attributedText = str;
}

-(void)setDescLabel:(NSString *)string
{
    if(string == nil || [string isEqualToString:@""]){
        return;
    }
    
}

/**
 *  重置属性
 */
-(void)reset
{
    self.imageView.image = nil;
//    self.title.text = @"";
//    self.desc.text = @"";
}

-(void)dealloc
{
    self.imageView = nil;
    self.maskView = nil;
    self.title = nil;
}

@end
