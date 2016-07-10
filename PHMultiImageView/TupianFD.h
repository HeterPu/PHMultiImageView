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
 *  @brief  浏览头像
 *
 *  @param  oldImageView    头像所在的imageView
 */
+(void)showImage:(UIImageView*)avatarImageView;



-(void)showWithImageArrayLocal:(NSArray *)array
              andSelectedIndex:(NSInteger)index
                   andImagview:(UIImageView *)imagev;
-(void)showWithImageArrayWeb:(NSArray *)array
            andSelectedIndex:(NSInteger)index
                 andImagview:(UIImageView *)imagev;

@end
