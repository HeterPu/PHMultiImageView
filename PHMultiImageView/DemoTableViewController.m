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

@interface DemoTableViewController ()


@property(nonatomic,strong)NSArray *urlSumArray;


@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor= [UIColor cyanColor];
    
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    self.tableView.tableHeaderView = header;
    
    
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
    }
    return _urlSumArray;
}



#pragma mark - Table view data source


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat phheight = [[PHMultiImageView alloc]getRectFromFrame:[UIScreen mainScreen].bounds andArray:self.urlSumArray[indexPath.section]].size.height;
    NSLog(@"vvvvvv%li",indexPath.section);
    NSLog(@"vvvvvv%f",[[PHMultiImageView alloc]getRectFromFrame:[UIScreen mainScreen].bounds andArray:self.urlSumArray[indexPath.section]].size.width);
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
    cell.urlarray = self.urlSumArray[indexPath.section];
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
