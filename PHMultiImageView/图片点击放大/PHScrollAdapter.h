//
//  PHScrollAdapter.h
//  PHMultiImageView
//
//  Created by Peter on 7/8/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

//滚动代理适应器，专门用于处理代理事件，将具备某种功能的对象作为一种协议对象类型，而不仅仅是具体的某一类，可以使代码更好的被重用。


@interface PHScrollAdapter : NSObject <UIScrollViewDelegate>

@end
