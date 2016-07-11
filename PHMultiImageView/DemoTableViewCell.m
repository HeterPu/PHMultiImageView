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


+(instancetype)DemoCellWithTableView:(UITableView *)tableview andIndexpath:(NSIndexPath *)indexPath {
    static NSString *ID = @"demo";
    NSString *cellID = [NSString stringWithFormat:@"cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];
  DemoTableViewCell  *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[DemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
//    DemoTableViewCell  *cell = [[DemoTableViewCell alloc] init];
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        PHMultiImageView *myview = [[PHMultiImageView alloc] init];
        myview.backgroundColor = [UIColor lightGrayColor];
        
        [self.contentView addSubnode:myview];
        _phMulti = myview;
    }
    return self;
}

//-(instancetype)init {
//    self = [super init];
//    if (self) {
//            PHMultiImageView *myview = [[PHMultiImageView alloc] init];
//            myview.backgroundColor = [UIColor lightGrayColor];
//    
//            [self addSubnode:myview];
//            _phMulti = myview;
//    }
//    
//    return  self;
//}



-(void)setUrlarray:(NSArray *)urlarray {
    _urlarray = urlarray;
    [self settingframeandData];
    
}


-(void)settingframeandData{

    [_phMulti PHMIVWithWidth:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 100) AndLocalPicArray:_urlarray];
    
}
     
     

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
