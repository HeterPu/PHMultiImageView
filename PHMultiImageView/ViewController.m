//
//  ViewController.m
//  PHMultiImageView
//
//  Created by Peter on 7/7/16.
//  Copyright © 2016 Peter. All rights reserved.
//

#import "ViewController.h"
#import "PHMultiImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage * pic1 = [UIImage imageNamed:@"1"];
    UIImage * pic2 = [UIImage imageNamed:@"2"];
    UIImage * pic3 = [UIImage imageNamed:@"3"];
    UIImage * pic4 = [UIImage imageNamed:@"4"];
    UIImage * pic5 = [UIImage imageNamed:@"5"];
    UIImage * pic6 = [UIImage imageNamed:@"6"];
    UIImage * pic7 = [UIImage imageNamed:@"7"];
    UIImage * pic8 = [UIImage imageNamed:@"8"];
    UIImage * pic9 = [UIImage imageNamed:@"9"];
    
    NSString *str1 =@"http://t1.mmonly.cc/uploads/allimg/20150416/31779-yezRjZ.jpg";
    NSString *str2 =@"http://e.hiphotos.baidu.com/image/h%3D200/sign=c898bddf19950a7b6a3549c43ad0625c/14ce36d3d539b600be63e95eed50352ac75cb7ae.jpg";
    NSString *str3 =@"http://t1.mmonly.cc/uploads/allimg/20150416/31779-yezRjZ.jpg";
    NSString *str4 =@"http://t1.mmonly.cc/uploads/allimg/20150416/31779-yezRjZ.jpg";
    NSString *str5 =@"http://t1.mmonly.cc/uploads/allimg/20150416/31779-yezRjZ.jpg";
    NSString *str6 =@"http://t1.mmonly.cc/uploads/allimg/20150416/31779-yezRjZ.jpg";
    NSString *str7 =@"http://t1.mmonly.cc/uploads/allimg/20150416/31779-yezRjZ.jpg";
    NSString *str8 =@"http://t1.mmonly.cc/uploads/allimg/20150416/31779-yezRjZ.jpg";
    NSString *str9 =@"http://t1.mmonly.cc/uploads/allimg/20150416/31779-yezRjZ.jpg";

    
    
    NSMutableArray * arrray = [NSMutableArray array];
    [arrray addObject:str1];
    [arrray addObject:str2];
    [arrray addObject:str3];
    [arrray addObject:str4];
    [arrray addObject:str5];
//    [arrray addObject:pic6];
//    [arrray addObject:pic7];
//    [arrray addObject:pic8];
//    [arrray addObject:pic9];
    
    PHMultiImageView *myview = [[PHMultiImageView alloc] init];
    myview.backgroundColor = [UIColor redColor];
    [myview PHMIVWithWidth:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 100) AndWebPicUrlArray:arrray];
    
    [self.view addSubview:myview];
    
    
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [self.view addGestureRecognizer: tap];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)click:(id)sender {
    NSLog(@"self.view click");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
