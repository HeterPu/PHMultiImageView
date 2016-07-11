//
//  DemoTableViewController.m
//  PHMultiImageView
//
//  Created by Peter on 7/11/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import "DemoTableViewController.h"
#import "DemoTableViewCell.h"
#import "PHMultiImageView.h"

#import "SDWebImageManager.h"

#import "YYFPSLabel.h"

@interface DemoTableViewController ()


@property(nonatomic,strong)NSArray *urlSumArray;
@property(nonatomic,strong)NSArray *localSumArray;


@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor= [UIColor cyanColor];
    
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    self.tableView.tableHeaderView = header;
    UIView *vvvv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    vvvv.backgroundColor = [UIColor redColor];
    
    YYFPSLabel *fps = [YYFPSLabel new];
    fps.frame = CGRectMake(0, 0, 60, 40);
    self.navigationItem.titleView = fps;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(NSArray *)urlSumArray {
    if (!_urlSumArray) {
        
    NSArray *array = [NSArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"urlarray" ofType:@"plist"];
    array = [[NSArray alloc] initWithContentsOfFile:path];
    _urlSumArray = array;
    [self settingWebImageWithArray:array];
    }
    return _urlSumArray;
}


-(NSArray *)localSumArray {
    if (!_localSumArray) {
        
        NSArray *array = [NSArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"localimage" ofType:@"plist"];
        array = [[NSArray alloc] initWithContentsOfFile:path];
        
       _localSumArray = [self settingLocalImageWithArray:array];
    }
    return _localSumArray;
}


-(NSArray *)settingLocalImageWithArray:(NSArray *)array {
    NSArray *temp = [NSArray array];
    NSMutableArray *tempt = [NSMutableArray array];
    for (int i = 0;i < array.count;i++) {
        NSMutableArray *temptt = [NSMutableArray array];
        for (int j = 0; j < [array[i] count]; j++) {
            UIImage *image = [UIImage imageNamed:array[i][j]];
            [temptt addObject:image];
    }
        [tempt addObject:temptt];
  }
    temp = tempt;
    return temp;
}


    
-(void)settingWebImageWithArray:(NSArray *)array {

    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    for (int i = 0;i < array.count;i++) {
        for (int j = 0; j < [array[i] count]; j++) {
            NSString *str = array[i][j];
            if([manager diskImageExistsForURL:[NSURL URLWithString:str]]){
                NSLog(@"link is %@",[manager cacheKeyForURL:[NSURL URLWithString:str]]);
            }
            else
            {
                
                [manager downloadImageWithURL:[NSURL URLWithString:str] options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                    
                }];
            }
       }
    }
    
}


#pragma mark - Table view data source


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat phheight = [[PHMultiImageView alloc]getRectFromFrame:[UIScreen mainScreen].bounds andArray:self.localSumArray[indexPath.section]].size.height;
    return phheight + 50;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 16;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoTableViewCell *cell = [DemoTableViewCell DemoCellWithTableView:tableView];
//    cell.urlarray = self.urlSumArray[indexPath.section];
    cell.urlarray = self.localSumArray[indexPath.section];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
