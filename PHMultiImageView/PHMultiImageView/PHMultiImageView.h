//
//  PHMultiImageView.h
//  PHMultiImageView
//
//  Created by Peter on 7/7/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PHimageAllLoadedDelegate <NSObject>

-(void)loadedchangedelegate;

@end


@interface PHMultiImageView : UIView


-(CGRect)PHMIVWithWidth:(CGRect)frame
      AndWebPicUrlArray:(NSArray *)array;

-(CGRect)PHMIVWithWidth:(CGRect)frame
       AndLocalPicArray:(NSArray *)array;

-(CGRect)getRectFromFrame:(CGRect)frame andArray:(NSArray *)array;
@end
