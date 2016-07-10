//
//  PHMultiImageView.h
//  PHMultiImageView
//
//  Created by Peter on 7/7/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHMultiImageView : UIView


-(CGRect)PHMIVWithWidth:(CGRect)frame
      AndWebPicUrlArray:(NSArray *)array;

-(CGRect)PHMIVWithWidth:(CGRect)frame
       AndLocalPicArray:(NSArray *)array;

@end
