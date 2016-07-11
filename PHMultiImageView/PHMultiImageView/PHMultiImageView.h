//
//  PHMultiImageView.h
//  PHMultiImageView
//
//  Created by Peter on 7/7/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncDisplayKit/AsyncDisplayKit.h"


@interface PHMultiImageView : ASDisplayNode


-(CGRect)PHMIVWithWidth:(CGRect)frame
      AndWebPicUrlArray:(NSArray *)array;

-(CGRect)PHMIVWithWidth:(CGRect)frame
       AndLocalPicArray:(NSArray *)array;

-(CGRect)getRectFromFrame:(CGRect)frame andArray:(NSArray *)array;
@end
