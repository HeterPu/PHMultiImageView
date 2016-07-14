//
//  PHMultiImageView.h
//  PHMultiImageView
//
//  Created by Peter on 7/7/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PHMultiImageView : UIView

/**
 *  设置本地图片视图的尺寸和数组
 *
 *  @param frame 视图的尺寸
 *  @param array 视图的数组，封装了UIImage
 *
 *  @return 返回设置后的尺寸（可以不用，使用getrect代替）
 */
-(CGRect)PHMIVWithWidth:(CGRect)frame
      AndWebPicUrlArray:(NSArray *)array;

/**
 *  设置网络图片视图的尺寸和数组
 *
 *  @param frame 视图的尺寸
 *  @param array 视图的数组，封装了NSUrl
 *
 *  @return 返回设置后的尺寸（可以不用，使用getrect代替）
 */
-(CGRect)PHMIVWithWidth:(CGRect)frame
       AndLocalPicArray:(NSArray *)array;

/**
 *  获取给定数组的尺寸
 *
 *  @param frame 视图的尺寸
 *  @param array 视图的数组
 *
 *  @return 返回设置后的尺寸
 */
-(CGRect)getRectFromFrame:(CGRect)frame
                 andArray:(NSArray *)array;
@end
