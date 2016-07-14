//
//  PHMultiImageView.m
//  PHMultiImageView
//
//  Created by Peter on 7/7/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import "PHMultiImageView.h"
#import "UIImageView+WebCache.h"
#import "TupianFD.h"
#import "UIImage+Common.h"

#define KPicMargin 0
#define KPicPadding 2

@interface PHMultiImageView()



@property(nonatomic,weak)UIImageView *imageView1;
@property(nonatomic,weak)UIImageView *imageView2;
@property(nonatomic,weak)UIImageView *imageView3;
@property(nonatomic,weak)UIImageView *imageView4;
@property(nonatomic,weak)UIImageView *imageView5;
@property(nonatomic,weak)UIImageView *imageView6;
@property(nonatomic,weak)UIImageView *imageView7;
@property(nonatomic,weak)UIImageView *imageView8;
@property(nonatomic,weak)UIImageView *imageView9;


@property(nonatomic,strong) NSArray *thumbNailPicArray;
@property(nonatomic,strong) NSArray *originalPicArray;

@property(nonatomic,strong) NSArray *urlPicArray;

@property(nonatomic,strong)TupianFD *tupianFD;

@end

@implementation PHMultiImageView



-(instancetype)init {
    self = [super init];
    if (self) {
        UIImageView *imageV1 = [[UIImageView alloc] init];
        UIImageView *imageV2 = [[UIImageView alloc] init];
        UIImageView *imageV3 = [[UIImageView alloc] init];
        UIImageView *imageV4 = [[UIImageView alloc] init];
        UIImageView *imageV5 = [[UIImageView alloc] init];
        UIImageView *imageV6 = [[UIImageView alloc] init];
        UIImageView *imageV7 = [[UIImageView alloc] init];
        UIImageView *imageV8 = [[UIImageView alloc] init];
        UIImageView *imageV9 = [[UIImageView alloc] init];
        [self addSubview:imageV1];
        [self addSubview:imageV2];
        [self addSubview:imageV3];
        [self addSubview:imageV4];
        [self addSubview:imageV5];
        [self addSubview:imageV6];
        [self addSubview:imageV7];
        [self addSubview:imageV8];
        [self addSubview:imageV9];
        _imageView1 = imageV1;
        _imageView2 = imageV2;
        _imageView3 = imageV3;
        _imageView4 = imageV4;
        _imageView5 = imageV5;
        _imageView6 = imageV6;
        _imageView7 = imageV7;
        _imageView8 = imageV8;
        _imageView9 = imageV9;
        _imageView1.tag = 1;
        _imageView2.tag = 2;
        _imageView3.tag = 3;
        _imageView4.tag = 4;
        _imageView5.tag = 5;
        _imageView6.tag = 6;
        _imageView7.tag = 7;
        _imageView8.tag = 8;
        _imageView9.tag = 9;
        _imageView1.userInteractionEnabled = YES;
        _imageView2.userInteractionEnabled = YES;
        _imageView3.userInteractionEnabled = YES;
        _imageView4.userInteractionEnabled = YES;
        _imageView5.userInteractionEnabled = YES;
        _imageView6.userInteractionEnabled = YES;
        _imageView7.userInteractionEnabled = YES;
        _imageView8.userInteractionEnabled = YES;
        _imageView9.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap1  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
        UITapGestureRecognizer *tap2  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
        UITapGestureRecognizer *tap3  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
        UITapGestureRecognizer *tap4  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
        UITapGestureRecognizer *tap5  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
        UITapGestureRecognizer *tap6  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
        UITapGestureRecognizer *tap7  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
        UITapGestureRecognizer *tap8  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
        UITapGestureRecognizer *tap9  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
        [_imageView1 addGestureRecognizer:tap1];
        [_imageView2 addGestureRecognizer:tap2];
        [_imageView3 addGestureRecognizer:tap3];
        [_imageView4 addGestureRecognizer:tap4];
        [_imageView5 addGestureRecognizer:tap5];
        [_imageView6 addGestureRecognizer:tap6];
        [_imageView7 addGestureRecognizer:tap7];
        [_imageView8 addGestureRecognizer:tap8];
        [_imageView9 addGestureRecognizer:tap9];
    }
    return self;
}


-(void)magnifyImage:(UIGestureRecognizer *)sender {
    
    NSLog(@"局部放大");
    TupianFD *tupianfd = [[TupianFD alloc] init];
    _tupianFD = tupianfd;
//    [tupianfd showWithImageArrayLocal:_originalPicArray andSelectedIndex:sender.view.tag andImagview:(UIImageView *)sender.view];
//    NSInteger der= sender.view.tag;
    [tupianfd showWithImageArrayWeb:_urlPicArray andSelectedIndex:sender.view.tag andImagview:(UIImageView *)sender.view];
    
//    [tupianfd  showWithImageArrayLocal:_originalPicArray andSelectedIndex:sender.view.tag andImagview:(UIImageView *)sender.view];
}


/**
 *  内部装有URL的字符串对象，需要自己包装字符串数组
 *
 *  @param frame
 *  @param array
 *
 *  @return
 */
-(CGRect)PHMIVWithWidth:(CGRect)frame
      AndWebPicUrlArray:(NSArray *)array {
  CGRect rect = [self getRectFromFrame:frame andArray:array];
  [self settingImageViewWithPicArrayWeb:array];
    _urlPicArray = array;
  return rect;
 
}



/**
 *  array 内部装有uiimage对象，需要自己包装uiimage数组
 *
 *  @param frame
 *  @param settingImageViewWithPicArray
 *  @param array
 *
 *  @return 返回视图调整后的frame
 */
-(CGRect)PHMIVWithWidth:(CGRect)frame
       AndLocalPicArray:(NSArray *)array {
    CGRect rect = [self getRectFromFrame:frame andArray:array];
    [self settingImageViewWithPicArrayLocal:array];
    return rect;
}


-(void)settingImageViewWithPicArrayLocal:(NSArray *)array {
    _originalPicArray = array;
    switch (array.count) {
        case 0:
        {
            break;
        }
        case 1:
        {
            _thumbNailPicArray = [self getThumbNailPicArray:array AndIndex:1];
            [self settingLocalImageDataWithArray:_thumbNailPicArray];
            [self settingFrameWith:1];
            break;
        }
        case 2:
        {
            _thumbNailPicArray = [self getThumbNailPicArray:array AndIndex:2];
            [self settingLocalImageDataWithArray:_thumbNailPicArray];
            [self settingFrameWith:2];
            break;
        }
        case 3:
        {
            _thumbNailPicArray = [self getThumbNailPicArray:array AndIndex:3];
            [self settingLocalImageDataWithArray:_thumbNailPicArray];
            [self settingFrameWith:3];
            break;
        }
        case 4:
        {
            _thumbNailPicArray = [self getThumbNailPicArray:array AndIndex:4];
            [self settingLocalImageDataWithArray:_thumbNailPicArray];
            [self settingFrameWith:4];
            break;
        }
        case 5:
        {
            _thumbNailPicArray = [self getThumbNailPicArray:array AndIndex:5];
            [self settingLocalImageDataWithArray:_thumbNailPicArray];
            [self settingFrameWith:5];
            break;
        }
        case 6:
        {
            _thumbNailPicArray = [self getThumbNailPicArray:array AndIndex:6];
            [self settingLocalImageDataWithArray:_thumbNailPicArray];
            [self settingFrameWith:6];
            break;
        }
        case 7:
        {
            _thumbNailPicArray = [self getThumbNailPicArray:array AndIndex:7];
            [self settingLocalImageDataWithArray:_thumbNailPicArray];
            [self settingFrameWith:7];
            break;
        }
        case 8:
        {
            _thumbNailPicArray = [self getThumbNailPicArray:array AndIndex:8];
            [self settingLocalImageDataWithArray:_thumbNailPicArray];
            [self settingFrameWith:8];
            break;
        }
        default:
            _thumbNailPicArray = [self getThumbNailPicArray:array AndIndex:9];
            [self settingLocalImageDataWithArray:_thumbNailPicArray];
            [self settingFrameWith:9];
    }

}


-(NSArray *)getThumbNailPicArray:(NSArray *)PicArray AndIndex:(NSInteger)index {
    NSMutableArray *tempt = [NSMutableArray array];
    for (UIImage * image in PicArray) {
        CGSize thumbsize = [self getThumbNailSizeWith:index];
        UIImage *thumbimage = [image  cropCenterAndScaleImageToSize:thumbsize];
        [tempt addObject:thumbimage];
    }
    return tempt;
}


-(CGSize)getThumbNailSizeWith:(NSInteger)index {
    CGRect screenB = self.frame;
    CGRect picrect;
    switch (index) {
        case 1:
        {
            picrect = CGRectMake(0, 0,screenB.size.width - 2 * KPicMargin, (screenB.size.height - 2 * KPicMargin));
            break;
        }
        case 2:
        {
            picrect = CGRectMake(0, 0,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2 , (screenB.size.height - 2 * KPicMargin));
            break;
        }
        case 3:
        {
            picrect = CGRectMake(0, 0,screenB.size.width - 2 * KPicMargin, (screenB.size.width - 2 * KPicMargin) * 0.75);
            break;
        }
        case 4:
        {
            picrect = CGRectMake(0, 0, (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            break;
        }
        case 5:
        {
            picrect = CGRectMake(0, 0,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2 * 0.75);
            break;
        }
        case 6:
        {
            picrect = CGRectMake(0, 0,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            break;
        }
        case 7:
        {
            picrect = CGRectMake(0, 0,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            break;
        }
        case 8:
        {
            picrect = CGRectMake(0, 0,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            break;
        }
        case 9:
        {
            picrect = CGRectMake(0, 0,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            break;
        }
        default:
            break;
    }
    CGSize thumbsize = CGSizeMake(picrect.size.width*2, picrect.size.height*2);
    return thumbsize;
}



-(void)settingImageViewWithPicArrayWeb:(NSArray *)array {
    
    switch (array.count) {
        case 0:
        {
            break;
        }
        case 1:
        {
            [self settingWebImageDataWithArray:array];
            [self settingFrameWith:1];
            break;
        }
        case 2:
        {
            [self settingWebImageDataWithArray:array];
            [self settingFrameWith:2];
            break;
        }
        case 3:
        {
            [self settingWebImageDataWithArray:array];
            [self settingFrameWith:3];
            break;
        }
        case 4:
        {
            [self settingWebImageDataWithArray:array];
            [self settingFrameWith:4];
            break;
        }
        case 5:
        {
            [self settingWebImageDataWithArray:array];
            [self settingFrameWith:5];
            break;
        }
        case 6:
        {
            [self settingWebImageDataWithArray:array];
            [self settingFrameWith:6];
            break;
        }
        case 7:
        {
            [self settingWebImageDataWithArray:array];
            [self settingFrameWith:7];
            break;
        }
        case 8:
        {
            [self settingWebImageDataWithArray:array];
            [self settingFrameWith:8];
            break;
        }
        default:
           [self settingWebImageDataWithArray:array];
           [self settingFrameWith:9];
    }
}



-(void)settingFrameWith:(NSInteger)count {
    CGRect screenB = self.frame;
    switch (count) {
        case 1:
        {
            _imageView1.hidden = NO;
            _imageView1.frame = CGRectMake(KPicMargin,KPicMargin,screenB.size.width - 2 * KPicMargin, (screenB.size.height - 2 * KPicMargin));
            _imageView2.hidden = YES;
            _imageView3.hidden = YES;
            _imageView4.hidden = YES;
            _imageView5.hidden = YES;
            _imageView6.hidden = YES;
            _imageView7.hidden = YES;
            _imageView8.hidden = YES;
            _imageView9.hidden = YES;
            break;
        }
        case 2:
        {
            _imageView1.hidden = NO;
            _imageView1.frame = CGRectMake(KPicMargin,KPicMargin,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2 , (screenB.size.height - 2 * KPicMargin));
            _imageView2.hidden = NO;
            _imageView2.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2,KPicMargin,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2, (screenB.size.height - 2 * KPicMargin));
            _imageView3.hidden = YES;
            _imageView4.hidden = YES;
            _imageView5.hidden = YES;
            _imageView6.hidden = YES;
            _imageView7.hidden = YES;
            _imageView8.hidden = YES;
            _imageView9.hidden = YES;
            break;
        }
        case 3:
        {
            _imageView1.hidden = NO;
            _imageView1.frame = CGRectMake(KPicMargin,KPicMargin,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2, (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2 * 0.75);
            _imageView2.hidden = NO;
            _imageView2.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2,KPicMargin,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2, (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2 * 0.75);
            _imageView3.hidden = NO;
            _imageView3.frame = CGRectMake(KPicMargin,KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2 * 0.75,screenB.size.width - 2 * KPicMargin, (screenB.size.width - 2 * KPicMargin) * 0.75);
            _imageView4.hidden = NO;

            _imageView4.hidden = YES;
            _imageView5.hidden = YES;
            _imageView6.hidden = YES;
            _imageView7.hidden = YES;
            _imageView8.hidden = YES;
            _imageView9.hidden = YES;
            break;
        }
        case 4:
        {
            _imageView1.hidden = NO;
            _imageView1.frame = CGRectMake(KPicMargin,KPicMargin,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView2.hidden = NO;
            _imageView2.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2,KPicMargin,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView3.hidden = NO;
            _imageView3.frame = CGRectMake(KPicMargin,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView4.hidden = NO;
            _imageView4.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView5.hidden = YES;
            _imageView6.hidden = YES;
            _imageView7.hidden = YES;
            _imageView8.hidden = YES;
            _imageView9.hidden = YES;
            break;
        }
        case 5:
        {
            _imageView1.hidden = NO;
            _imageView1.frame = CGRectMake(KPicMargin,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 0.75);
            _imageView2.hidden = NO;
            _imageView2.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 0.75);
            _imageView3.hidden = NO;
            _imageView3.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 0.75);
            _imageView4.hidden = NO;
            _imageView4.frame = CGRectMake(KPicMargin ,KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 0.75,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2, (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2 * 0.75);
            _imageView5.hidden = NO;
            _imageView5.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - KPicPadding) / 2,KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 0.75,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2,(screenB.size.width - 2 * KPicMargin - KPicPadding) / 2 * 0.75);
            _imageView6.hidden = YES;
            _imageView7.hidden = YES;
            _imageView8.hidden = YES;
            _imageView9.hidden = YES;
            break;
        }
        case 6:
        {
            _imageView1.hidden = NO;
            _imageView1.frame = CGRectMake(KPicMargin,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView2.hidden = NO;
            _imageView2.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView3.hidden = NO;
            _imageView3.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView4.hidden = NO;
            _imageView4.frame = CGRectMake(KPicMargin,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView5.hidden = NO;
            _imageView5.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView6.hidden = NO;
            _imageView6.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - KPicPadding) / 2);
            _imageView7.hidden = YES;
            _imageView8.hidden = YES;
            _imageView9.hidden = YES;
            break;
        }
        case 7:
        {
            _imageView1.hidden = NO;
            _imageView1.frame = CGRectMake(KPicMargin,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView2.hidden = NO;
            _imageView2.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView3.hidden = NO;
            _imageView3.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView4.hidden = NO;
            _imageView4.frame = CGRectMake(KPicMargin,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView5.hidden = NO;
            _imageView5.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView6.hidden = NO;
            _imageView6.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView7.hidden = NO;
            _imageView7.frame = CGRectMake(KPicMargin ,KPicMargin + 2 * KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView8.hidden = YES;
            _imageView9.hidden = YES;
            break;
        }
        case 8:
        {
            _imageView1.hidden = NO;
            _imageView1.frame = CGRectMake(KPicMargin,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView2.hidden = NO;
            _imageView2.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView3.hidden = NO;
            _imageView3.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView4.hidden = NO;
            _imageView4.frame = CGRectMake(KPicMargin,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView5.hidden = NO;
            _imageView5.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView6.hidden = NO;
            _imageView6.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView7.hidden = NO;
            _imageView7.frame = CGRectMake(KPicMargin ,KPicMargin + 2 * KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView8.hidden = NO;
            _imageView8.frame = CGRectMake(KPicMargin + 1 * KPicPadding + (screenB.size.width - 2 * KPicMargin - KPicPadding) / 3,KPicMargin + 2 * KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView9.hidden = YES;
            break;
        }
        case 9:
        {
            _imageView1.hidden = NO;
            _imageView1.frame = CGRectMake(KPicMargin,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3, (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView2.hidden = NO;
            _imageView2.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView3.hidden = NO;
            _imageView3.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,KPicMargin,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView4.hidden = NO;
            _imageView4.frame = CGRectMake(KPicMargin,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView5.hidden = NO;
            _imageView5.frame = CGRectMake(KPicMargin + KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView6.hidden = NO;
            _imageView6.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,KPicMargin + KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView7.hidden = NO;
            _imageView7.frame = CGRectMake(KPicMargin ,KPicMargin + 2 * KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            _imageView8.hidden = NO;
            _imageView8.frame = CGRectMake(KPicMargin + 1 * KPicPadding + (screenB.size.width - 2 * KPicMargin - KPicPadding) / 3,KPicMargin + 2 * KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);            _imageView9.hidden = NO;
                _imageView9.frame = CGRectMake(KPicMargin + 2 * KPicPadding + (screenB.size.width - 2 * KPicMargin - KPicPadding) / 3 * 2,KPicMargin + 2 * KPicPadding + (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3 * 2,(screenB.size.width - 2 * KPicMargin - 2 * KPicPadding) / 3,  (screenB.size.height - 2 * KPicMargin - 2 * KPicPadding) / 3);
            break;
        }
        default:
            break;
    }
}


-(void)settingLocalImageDataWithArray:(NSArray *)array{

    switch (array.count) {
        case 1:
        {
            _imageView1.image = array[0];
            _imageView2.image = nil;
            _imageView3.image = nil;
            _imageView4.image = nil;
            _imageView5.image = nil;
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 2:
        {
            _imageView1.image = array[0];
            _imageView2.image = array[1];
            _imageView3.image = nil;
            _imageView4.image = nil;
            _imageView5.image = nil;
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 3:
        {
            _imageView1.image = array[0];
            _imageView2.image = array[1];
            _imageView3.image = array[2];
            _imageView4.image = nil;
            _imageView5.image = nil;
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 4:
        {
            _imageView1.image = array[0];
            _imageView2.image = array[1];
            _imageView3.image = array[2];
            _imageView4.image = array[3];
            _imageView5.image = nil;
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 5:
        {
            _imageView1.image = array[0];
            _imageView2.image = array[1];
            _imageView3.image = array[2];
            _imageView4.image = array[3];
            _imageView5.image = array[4];
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 6:
        {
            _imageView1.image = array[0];
            _imageView2.image = array[1];
            _imageView3.image = array[2];
            _imageView4.image = array[3];
            _imageView5.image = array[4];
            _imageView6.image = array[5];
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 7:
        {
            _imageView1.image = array[0];
            _imageView2.image = array[1];
            _imageView3.image = array[2];
            _imageView4.image = array[3];
            _imageView5.image = array[4];
            _imageView6.image = array[5];
            _imageView7.image = array[6];
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 8:
        {
            _imageView1.image = array[0];
            _imageView2.image = array[1];
            _imageView3.image = array[2];
            _imageView4.image = array[3];
            _imageView5.image = array[4];
            _imageView6.image = array[5];
            _imageView7.image = array[6];
            _imageView8.image = array[7];
            _imageView9.image = nil;
            break;
        }
        case 9:
        {
            _imageView1.image = array[0];
            _imageView2.image = array[1];
            _imageView3.image = array[2];
            _imageView4.image = array[3];
            _imageView5.image = array[4];
            _imageView6.image = array[5];
            _imageView7.image = array[6];
            _imageView8.image = array[7];
            _imageView9.image = array[8];
            break;
        }
        default:
        {
            _imageView1.image = array[0];
            _imageView2.image = array[1];
            _imageView3.image = array[2];
            _imageView4.image = array[3];
            _imageView5.image = array[4];
            _imageView6.image = array[5];
            _imageView7.image = array[6];
            _imageView8.image = array[7];
            _imageView9.image = array[8];
            break;
        }
    }
}



-(void)settingWebThumbNailImageWithImageView:(UIImageView *)view andUrlString:(NSString *)str andCount:(NSInteger)count {
    __typeof(self) weakSelf = self;
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    if([manager diskImageExistsForURL:[NSURL URLWithString:str]]){
        //        NSLog(@"link is %@",[manager cacheKeyForURL:[NSURL URLWithString:str]]);
        UIImage *image = [manager.imageCache imageFromDiskCacheForKey:str];
        CGSize thumsize = [self getThumbNailSizeWith:count];
        UIImage *image1 = image;
        NSLog(@"image width %f and height %f",image1.size.width,image1.size.width);
        [image1 cropCenterAndScaleImageToSize:thumsize];
        view.image = image1;
    }
    else
    {
        [manager downloadImageWithURL:[NSURL URLWithString:str] options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            CGSize thumsize = [weakSelf getThumbNailSizeWith:count];
            UIImage *image1 = image;
            [image1 cropCenterAndScaleImageToSize:thumsize];
            view.image = image1;
            if (cacheType == SDImageCacheTypeDisk) {
                NSLog(@"fffffff");
            }
        }];
    }
    
}


-(void)settingWebImageDataWithArray:(NSArray *)array{
    
    switch (array.count) {
        case 1:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            _imageView2.image = nil;
            _imageView3.image = nil;
            _imageView4.image = nil;
            _imageView5.image = nil;
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 2:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView2 andUrlString:array[1] andCount:array.count];
            _imageView3.image = nil;
            _imageView4.image = nil;
            _imageView5.image = nil;
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 3:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView2 andUrlString:array[1] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView3 andUrlString:array[2] andCount:array.count];
            _imageView4.image = nil;
            _imageView5.image = nil;
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 4:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView2 andUrlString:array[1] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView3 andUrlString:array[2] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView4 andUrlString:array[3] andCount:array.count];
            _imageView5.image = nil;
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 5:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView2 andUrlString:array[1] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView3 andUrlString:array[2] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView4 andUrlString:array[3] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView5 andUrlString:array[4] andCount:array.count];
            _imageView6.image = nil;
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 6:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView2 andUrlString:array[1] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView3 andUrlString:array[2] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView4 andUrlString:array[3] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView5 andUrlString:array[4] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView6 andUrlString:array[5] andCount:array.count];
            _imageView7.image = nil;
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 7:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView2 andUrlString:array[1] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView3 andUrlString:array[2] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView4 andUrlString:array[3] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView5 andUrlString:array[4] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView6 andUrlString:array[5] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView7 andUrlString:array[6] andCount:array.count];
            _imageView8.image = nil;
            _imageView9.image = nil;
            break;
        }
        case 8:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView2 andUrlString:array[1] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView3 andUrlString:array[2] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView4 andUrlString:array[3] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView5 andUrlString:array[4] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView6 andUrlString:array[5] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView7 andUrlString:array[6] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView8 andUrlString:array[7] andCount:array.count];
            _imageView9.image = nil;
            break;
        }
        case 9:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView2 andUrlString:array[1] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView3 andUrlString:array[2] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView4 andUrlString:array[3] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView5 andUrlString:array[4] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView6 andUrlString:array[5] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView7 andUrlString:array[6] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView8 andUrlString:array[7] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView9 andUrlString:array[8] andCount:array.count];
            break;
        }
        default:
        {
            [self settingWebThumbNailImageWithImageView:_imageView1 andUrlString:array[0] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView2 andUrlString:array[1] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView3 andUrlString:array[2] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView4 andUrlString:array[3] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView5 andUrlString:array[4] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView6 andUrlString:array[5] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView7 andUrlString:array[6] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView8 andUrlString:array[7] andCount:array.count];
            [self settingWebThumbNailImageWithImageView:_imageView9 andUrlString:array[8] andCount:array.count];
            break;        }
    }
    
}




-(CGRect)getRectFromFrame:(CGRect)frame andArray:(NSArray *)array {
    CGFloat width = frame.size.width;
    CGFloat pointx = frame.origin.x;
    CGFloat pointy = frame.origin.y;
    CGFloat height;
    switch (array.count) {
        case 0:
            height = 0;
            break;
        case 1:
        {
            
            height = (width - 2 * KPicMargin) * 0.75 + 2 * KPicMargin;
            break;
        }
        case 2:
            height = (width - 2 * KPicMargin - KPicPadding) / 2 * 0.75 + 2 * KPicMargin;
            break;
        case 3:
            height = (width - 2 * KPicMargin - KPicPadding) / 2 * 0.75 + 2 * KPicMargin + KPicPadding + (width- 2 * KPicMargin) * 0.75;
            break;
        case 4:
            height = (width - 2 * KPicMargin - KPicPadding) * 0.75 + 2 * KPicMargin + KPicPadding;
            break;
        case 5:
            height = (width - 2 * KPicMargin - KPicPadding) / 2 * 0.75 + (width - 2 * KPicMargin -2 *KPicPadding) / 3 * 0.75 + 2 * KPicMargin +  1* KPicPadding;
            break;
        case 6:
            height = (width - 2 * KPicMargin - 2 *KPicPadding) / 3 * 0.75 * 2 + 2 * KPicMargin + KPicPadding;
            break;
        case 7:
            height = (width - 2 * KPicMargin - 2 *KPicPadding) / 3 * 0.75 * 3 + 2 * KPicMargin + 2 * KPicPadding;
            break;
        case 8:
            height = (width - 2 * KPicMargin - 2 *KPicPadding) / 3 * 0.75 * 3 + 2 * KPicMargin + 2 * KPicPadding;
            break;
        case 9:
            height = (width - 2 * KPicMargin - 2 *KPicPadding) / 3 * 0.75 * 3 + 2 * KPicMargin + 2 * KPicPadding;
            break;
        default:
            height = (width - 2 * KPicMargin - 2 *KPicPadding) / 3 * 0.75 * 3 + 2 * KPicMargin + 2 * KPicPadding;
            break;
    }
    
    self.frame = CGRectMake(pointx, pointy, width, height);
    return  CGRectMake(pointx, pointy, width, height);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
