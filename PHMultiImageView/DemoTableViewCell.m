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


+(instancetype)DemoCellWithTableView:(UITableView *)tableview {
    static NSString *ID = @"demo";
  DemoTableViewCell  *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[DemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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

    [_phMulti PHMIVWithWidth:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 100) AndWebPicUrlArray:_urlarray];
    
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
