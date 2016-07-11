//
//  tupianFD.m
//  RCTZ客户端
//
//  Created by peter on 16/3/16.
//  Copyright © 2016年 ph. All rights reserved.
//

#import "TupianFD.h"
#import "SDWebImageManager.h"

#import "UIImageView+WebCache.h"

static CGRect oldframe;

@interface TupianFD()<UIScrollViewDelegate>
@property (nonatomic,assign) NSInteger currentPageNumber;
@property(weak,nonatomic)UIScrollView *scrollView;

@property(nonatomic,strong)NSMutableArray * imageArray;
@property(nonatomic,strong)NSArray * urlStringArray;

@property(nonatomic,assign)BOOL  isWeb;


//@property(nonatomic,assign)float lastScale;
//@property (nonatomic,assign) NSInteger lastPageNumber;
//@property (assign,nonatomic)BOOL exuteOneTimeflag;

@end


@implementation TupianFD

+(void)showImage:(UIImageView *)avatarImageView{
    UIImage *image=avatarImageView.image;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldframe=[avatarImageView convertRect:avatarImageView.bounds toView:window];
    backgroundView.backgroundColor=[UIColor blackColor];
    backgroundView.alpha=0.2;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
    imageView.image=image;
    imageView.tag=1;
    [backgroundView addSubview:imageView];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
}

+(void)hideImage:(UITapGestureRecognizer*)tap{
    UIScrollView *backgroundView=(UIScrollView *)tap.view;
    UIImageView *imageView;
    if ([tap.view viewWithTag:1]) {
        imageView=(UIImageView*)[tap.view viewWithTag:1];
    }
    [UIView animateWithDuration:0.5 animations:^{
        imageView.frame=oldframe;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}


-(void)hideMultiImage:(UITapGestureRecognizer*)tap{
    UIScrollView *backgroundView=(UIScrollView *)tap.view;
    UIImageView *imageView;
    if ([tap.view viewWithTag:1]) {
        imageView=(UIImageView*)[tap.view viewWithTag:1];
    }
    [UIView animateWithDuration:0.5 animations:^{
        imageView.frame=oldframe;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}



-(UIScrollView *)getWebImageViewWithCount:(NSInteger)count
                              andImage:(UIImage *)image{
    
    UIScrollView *scrollview = [[UIScrollView alloc] init];
    scrollview.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    scrollview.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (count - 1 + 0.5) , [UIScreen mainScreen].bounds.size.height / 2);
    UIImageView *imageV = [[UIImageView alloc] init];
    
/*
 倘若需要网络图片默认背景，由于要设置背景图片，所以需要尺寸对其，故要执行以下代码，否则在网络图片未加载时可以不用设置图片视图的尺寸。
    imageV.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
    imageV.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (0.5) , [UIScreen mainScreen].bounds.size.height / 2);
*/
    imageV.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (0.5) , [UIScreen mainScreen].bounds.size.height / 2);
    
    imageV.image = image;
    imageV.userInteractionEnabled = YES;
    imageV.tag = 10;
    [scrollview addSubview:imageV];
    scrollview.maximumZoomScale=2.0;
    //设置最小伸缩比例
    scrollview.minimumZoomScale=1.0;
    scrollview.delegate = self;
    scrollview.backgroundColor = [UIColor blueColor];
       return scrollview;
}



-(UIScrollView *)getImageViewWithCount:(NSInteger)count
                              andImage:(UIImage *)image{
    UIScrollView *scrollview = [[UIScrollView alloc] init];
    scrollview.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    scrollview.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (count - 1 + 0.5) , [UIScreen mainScreen].bounds.size.height / 2);
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
    imageV.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (0.5) , [UIScreen mainScreen].bounds.size.height / 2);
    imageV.image = image;
    imageV.userInteractionEnabled = YES;
    imageV.tag = 10;
    [scrollview addSubview:imageV];
    scrollview.maximumZoomScale=2.0;
    //设置最小伸缩比例
    scrollview.minimumZoomScale=1.0;
    scrollview.delegate = self;
    scrollview.backgroundColor = [UIColor blueColor];
    BOOL isLongPic = (image.size.height / image.size.width) > ([UIScreen mainScreen].bounds.size.height / [UIScreen mainScreen].bounds.size.width) ? YES : NO;
    if (isLongPic) {
        scrollview.contentSize = CGSizeMake(0,[UIScreen mainScreen].bounds.size.width * image.size.height / image.size.width);
        imageV.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (0.5) , [UIScreen mainScreen].bounds.size.width * image.size.height / image.size.width / 2                                                                                         );
    }
    return scrollview;
}



-(void)showWithImageArrayWeb:(NSArray *)array
            andSelectedIndex:(NSInteger)index
                 andImagview:(UIImageView *)imagev
{
    
    _urlStringArray = [array copy];
    _isWeb = YES;
    
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    oldframe=[imagev convertRect:imagev.bounds toView:window];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    for (int i = 1; i < array.count + 1; i++) {
        UIImage *image = [UIImage imageNamed:@""];
        UIScrollView *tempt = [self getWebImageViewWithCount:i andImage:image] ;
        tempt.tag = 10 + i;
        [scrollView addSubview:tempt];
    }
    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * (array.count), 0);
 
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor blueColor];
    [window addSubview:scrollView];

    scrollView.delegate = self;
    scrollView.alpha = 0.2;
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMultiImage:)];
    [scrollView addGestureRecognizer: tap];
    _scrollView = scrollView;
    
    
    UIScrollView *currentview = [scrollView viewWithTag:index + 10];
    currentview.hidden = YES;
    
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
    imageView.image=imagev.image;
    
    [window addSubview:scrollView];
    [window addSubview:imageView];
    
    scrollView.contentOffset = CGPointMake((index - 1) * [UIScreen mainScreen].bounds.size.width, 0);
    _currentPageNumber = index - 1;

    __typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
            imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-imageView.image.size.height*[UIScreen mainScreen].bounds.size.width/imageView.image.size.width)/2, [UIScreen mainScreen].bounds.size.width, imageView.image.size.height*[UIScreen mainScreen].bounds.size.width/imageView.image.size.width);
        
        scrollView.alpha=1;
        
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
        currentview.hidden = NO;
        [weakSelf settingWebImageWithScrollView:[scrollView viewWithTag:index + 10]];
        
    }];
}



-(void)settingWebImageWithScrollView:(UIScrollView *)scrollview
{
    UIImageView *imageview = [scrollview viewWithTag:10];
    if (imageview) {
        imageview.tag = 11;
        
        [imageview sd_setImageWithURL:[NSURL URLWithString: _urlStringArray[scrollview.tag - 11]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            
            imageview.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
            imageview.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (0.5) , [UIScreen mainScreen].bounds.size.height / 2);
            imageview.image = image;
            BOOL isLongPic = (image.size.height / image.size.width) > ([UIScreen mainScreen].bounds.size.height / [UIScreen mainScreen].bounds.size.width) ? YES : NO;
            if (isLongPic) {
                scrollview.contentSize = CGSizeMake(0,[UIScreen mainScreen].bounds.size.width * image.size.height / image.size.width);
                imageview.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (0.5) , [UIScreen mainScreen].bounds.size.width * image.size.height / image.size.width / 2                                                                                         );
            }
        }];
    }
}

//-(void)settingWebImageWithUrlArray:(NSArray *)array andSlectedIndex:(NSInteger)index {
//    NSInteger selectedScaleIndex = index / 10;
//    for (NSInteger startint = selectedScaleIndex * 10; startint < array.count; startint++) {
//        SDWebImageManager *sdManager = [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:array[startint]] options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//            
//        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//            [_imageArray replaceObjectAtIndex:startint withObject:image];
//        }];
//
//    }
//}



-(void)showWithImageArrayLocal:(NSArray *)array
              andSelectedIndex:(NSInteger)index
                   andImagview:(UIImageView *)imagev
{
    _isWeb = NO;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    oldframe=[imagev convertRect:imagev.bounds toView:window];
    UIImage *imageavatar =  [array[index - 1] copy];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    for (int i = 1; i < array.count + 1; i++) {
        UIImage *image = array[i-1];
        UIScrollView *tempt = [self getImageViewWithCount:i andImage:image];
        tempt.tag = 10 + i;
        [scrollView addSubview:tempt];
    }
    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * (array.count), 0);
//    scrollView.contentSize = CGSizeMake(0, 0);
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor blackColor];
    [window addSubview:scrollView];
//    PHScrollAdapter *adapter = [[PHScrollAdapter alloc] init];
    scrollView.delegate = self;
    //设置最大伸缩比例

//    UIButton *BTN = [UIButton buttonWithType:UIButtonTypeSystem];
//    BTN.frame = CGRectMake(0, 60, 200, 200);
//    BTN.backgroundColor = [UIColor blueColor];
//    [BTN addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    [scrollView addSubview:BTN];
    
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMultiImage:)];
    [scrollView addGestureRecognizer: tap];
    _scrollView = scrollView;
    
    
    UIScrollView *currentview = [scrollView viewWithTag:index + 10];
    currentview.hidden = YES;
    
    UIImageView *imageViewavatar=[[UIImageView alloc]initWithFrame:oldframe];
    imageViewavatar.image=imageavatar;
    [window addSubview:imageViewavatar];
    scrollView.contentOffset = CGPointMake((index - 1) * [UIScreen mainScreen].bounds.size.width, 0);
    _currentPageNumber = index - 1;
//    _lastPageNumber = index - 1;
 
//    scrollView.contentOffset = CGPointMake((0) * [UIScreen mainScreen].bounds.size.width, 0);


    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        BOOL isLongPic = (imageavatar.size.height / imageavatar.size.width) > ([UIScreen mainScreen].bounds.size.height / [UIScreen mainScreen].bounds.size.width) ? YES : NO;
        if (isLongPic) {
            imageViewavatar.frame=CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, imageavatar.size.height*[UIScreen mainScreen].bounds.size.width/imageavatar.size.width);
        }
        else
        {
           imageViewavatar.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-imageavatar.size.height*[UIScreen mainScreen].bounds.size.width/imageavatar.size.width)/2, [UIScreen mainScreen].bounds.size.width, imageavatar.size.height*[UIScreen mainScreen].bounds.size.width/imageavatar.size.width);
        }
        scrollView.alpha=1;
        
    } completion:^(BOOL finished) {
        [imageViewavatar removeFromSuperview];
        currentview.hidden = NO;
        
//        scrollView.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tapscroll = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
//        tapscroll.numberOfTapsRequired = 1;
//        [scrollView addGestureRecognizer:tapscroll];
    }];
}



//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//
//        _scrollView.scrollEnabled = NO;
//  
//}
//
//
//
//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//    _scrollView.scrollEnabled = NO;
//}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (_scrollView == scrollView) {
    CGFloat offsetX = scrollView.contentOffset.x;
    // 2.求出页码
    double pageDouble = offsetX / scrollView.frame.size.width;
    _currentPageNumber = (NSInteger)(pageDouble + 0.5);
        if (_isWeb) {
            
            UIScrollView *scrollv = [scrollView viewWithTag:_currentPageNumber + 11];
                [self settingWebImageWithScrollView:scrollv];
            }
        }
//    NSLog(@"current page is %i",_currentPageNumber);
//    NSLog(@"dddd%f",scrollView.frame.size.height);
    
//    if (_currentPageNumber != _lastPageNumber) {
//        
//        if (self.exuteOneTimeflag) {
//            
//        UIScrollView *lastScrollView = [scrollView viewWithTag:_lastPageNumber + 11];
//        lastScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / self.lastScale, [UIScreen mainScreen].bounds.size.height / self.lastScale);
//        UIImageView *lastImageView = [lastScrollView viewWithTag:10];
//        CGRect imageViewBounds = lastImageView.bounds;
//        imageViewBounds.size.width = imageViewBounds.size.width / self.lastScale;
//        imageViewBounds.size.height = imageViewBounds.size.height /  self.lastScale;
//        lastImageView.bounds = imageViewBounds;
//            lastImageView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
//        lastImageView.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, lastImageView.image.size.height*[UIScreen mainScreen].bounds.size.width/lastImageView.image.size.width);
//        lastImageView.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (0.5) , [UIScreen mainScreen].bounds.size.height / 2);
//            lastScrollView.contentSize = CGSizeMake(0, 0);
//         BOOL isLongPic = (lastImageView.image.size.height / lastImageView.image.size.width) > ([UIScreen mainScreen].bounds.size.height / [UIScreen mainScreen].bounds.size.width) ? YES : NO;
//            if (isLongPic) {
//                lastScrollView.contentSize = CGSizeMake(0,[UIScreen mainScreen].bounds.size.width * lastImageView.image.size.height / lastImageView.image.size.width);
//                lastImageView.center = CGPointMake([UIScreen mainScreen].bounds.size.width * (0.5) , [UIScreen mainScreen].bounds.size.width * lastImageView.image.size.height / lastImageView.image.size.width / 2                                                                                         );
//            }
//            _exuteOneTimeflag = NO;
//        }
//
//    }
//     _lastPageNumber = _currentPageNumber;
//    }
        }


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    UIImageView *imageview = [scrollView viewWithTag:10];
    if (!imageview) {
        imageview = [scrollView viewWithTag:11];
    }
    return imageview;
}



-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    
}


-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
//    NSLog(@"dfdffdfddf%f",scale);
//    _lastScale = scale;
//    _lastPageNumber = scrollView.tag - 11;
//    _exuteOneTimeflag = YES;
    CGSize scrollViewSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    UIImageView *imageV = [scrollView viewWithTag:10];
    
    BOOL isLongPic = (imageV.image.size.height / imageV.image.size.width) > ([UIScreen mainScreen].bounds.size.height / [UIScreen mainScreen].bounds.size.width) ? YES : NO;
    if (isLongPic) {
        scrollViewSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width * imageV.image.size.height / imageV.image.size.width);
    }
   
    scrollViewSize.width = scrollViewSize.width * scale;
    scrollViewSize.height = scrollViewSize.height * scale;
    
    
    scrollView.contentSize = scrollViewSize;
//    view.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    NSLog(@"gggggg%f",scrollView.frame.size.height);
//    [scrollView setZoomScale:scale animated:NO];
}


//-(float)lastScale {
//    
//    if (!_lastScale) {
//        _lastScale = 1.0;
//    }
//    return _lastScale;
//}
//
//
//-(BOOL)exuteOneTimeflag {
//    if (!_exuteOneTimeflag) {
//        _exuteOneTimeflag = NO;
//    }
//    return  _exuteOneTimeflag;
//}

@end
