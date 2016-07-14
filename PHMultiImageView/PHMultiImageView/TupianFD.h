//
//  TupianFD.h
//  RCTZ客户端
//
//  Created by peter on 16/3/16.
//  Copyright © 2016年 ph. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TupianFD : NSObject

/**
 *  点击单个头像放大
 *
 *  @param avatarImageView 头像视图
 */
+(void)showImage:(UIImageView*)avatarImageView;


/**
 *  展示本地图片
 *
 *  @param array  本地图片数组，封装了UIImage
 *  @param index  点击图片位于相册的目录
 *  @param imagev 点击图片的View（方便进行动画）
 */
-(void)showWithImageArrayLocal:(NSArray *)array
              andSelectedIndex:(NSInteger)index
                   andImagview:(UIImageView *)imagev;

/**
 *  展示网络图片
 *
 *  @param array  网络图片数组，封装了NSUrl
 *  @param index  点击图片位于相册的目录
 *  @param imagev 点击图片的View（方便进行动画）
 */
-(void)showWithImageArrayWeb:(NSArray *)array
            andSelectedIndex:(NSInteger)index
                 andImagview:(UIImageView *)imagev;

@end
