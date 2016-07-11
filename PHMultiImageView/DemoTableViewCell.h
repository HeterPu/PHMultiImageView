//
//  DemoTableViewCell.h
//  PHMultiImageView
//
//  Created by Peter on 7/11/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncDisplayKit/AsyncDisplayKit.h"

@interface DemoTableViewCell : UITableViewCell

@property(nonatomic,strong)NSArray *urlarray;

+(instancetype)DemoCellWithTableView:(UITableView *)tableview andIndexpath:(NSIndexPath *)indexPath;
@end
