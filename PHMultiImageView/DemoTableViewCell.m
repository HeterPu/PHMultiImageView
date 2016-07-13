//
//  DemoTableViewCell.m
//  PHMultiImageView
//
//  Created by Peter on 7/11/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import "DemoTableViewCell.h"
#import "PHMultiImageView.h"


@interface DemoTableViewCell()

@property(nonatomic,weak)PHMultiImageView *phMulti;

@end

@implementation DemoTableViewCell


+(instancetype)DemoCellWithTableView:(UITableView *)tableview andIndexpath:(NSIndexPath *)indexpath{
    static NSString *ID = @"demo";
    NSString *idd = [NSString stringWithFormat:@"demo%li%li",indexpath.section,indexpath.row];
  DemoTableViewCell  *cell = [tableview dequeueReusableCellWithIdentifier:idd];
    if (cell == nil) {
        cell = [[DemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idd];
    }
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        PHMultiImageView *myview = [[PHMultiImageView alloc] init];
        myview.backgroundColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:myview];
        _phMulti = myview;
    }
    return self;
}



-(void)setUrlarray:(NSArray *)urlarray {
    _urlarray = urlarray;
    [self settingframeandData];
    
}


-(void)settingframeandData{
  
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{

        [_phMulti PHMIVWithWidth:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 100) AndWebPicUrlArray:_urlarray];
    
    });
                   
}




#pragma mark - Private method

- (UIImage *)snapshot:(UIView *)view

{
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size,YES,0);
    
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}



     

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
