//
//  clockViewController.m
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/28.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "clockViewController.h"
#import "clockNewView.h"
@interface clockViewController ()<UITableViewDataSource,UITableViewDelegate,clockNewViewDelegate>

@property (nonatomic ,weak)UIView *butomView;
@property (nonatomic ,strong)NSMutableArray *dates;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)creatNewClock:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation clockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dates = [@[]mutableCopy];
 //   [self.dates addObject:@"10:02"];
    
    
}


-(void)creatButtomView
{
//    [self.view addSubview:[clockNewView clockView]];
//    NSLog(@"subs:%@", self.view.subviews);
    CGFloat butom = 270;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height + butom, self.view.frame.size.width, butom)];
    
 //  view.backgroundColor = [UIColor grayColor];
    
    clockNewView *newView = [clockNewView clockView];
    
    newView.delegate = self;
 
//    NSLog(@"%@",newView);
    
    [view addSubview: newView];
    
    self.butomView = view;
    
    [self.view addSubview:self.butomView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   
    return self.dates.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"clockCell" forIndexPath:indexPath];
    
    UILabel *lab = (UILabel *)[cell viewWithTag:1];
    
   NSDate *date = self.dates[indexPath.row];
    
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    
    formater.dateFormat = @"HH:mm";
    
    lab.text = [formater stringFromDate:date];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}


- (IBAction)creatNewClock:(id)sender {
    
//    [self creatButtomView];
//    CGRect fram  = self.tableView.frame;
//    fram.origin.y = fram.origin.y - 270;
    
    self.tableView.contentOffset = CGPointMake(0, 270);
    
    if (!self.butomView) {
        [self creatButtomView];
    }
   [UIView animateWithDuration:1.0 animations:^{
        self.butomView.frame = CGRectMake(0, self.view.frame.size.height - self.butomView.frame.size.height , self.view.frame.size.width, 270);
    } completion:nil];
    
}




#pragma mark - datepick代理方法   
//取消按钮
-(void)clockNew:(clockNewView *)view CansaleBtnClick:(id)sender
{
    NSLog(@"代理的 取消按钮");
  
    [UIView animateWithDuration:1.0 animations:^{
           self.butomView.frame = CGRectMake(0, self.view.frame.size.height , self.view.frame.size.width, 270);
    } completion:^(BOOL finished) {
        [self.butomView removeFromSuperview];
    }];
}


-(void)clockNew:(clockNewView *)view DoneBtnClick:(id)sender
{
    NSDate *data = view.datePicker.date;
    
    NSLog(@"date ---%@",data);
    
    [self.dates addObject:data];
    
    [self.tableView reloadData];
    
}

- (IBAction)clearButtonClick:(id)sender {
    
 
    
}

- (IBAction)saveButtonClick:(id)sender {
    
    
}

@end
