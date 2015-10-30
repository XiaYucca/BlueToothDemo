//
//  saveTableViewViewController.m
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/28.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "saveTableViewViewController.h"
#import "TouchTableViewController.h"


@interface saveTableViewViewController ()<TouchTableViewControllerDelegate>

- (IBAction)leftBtnTap:(id)sender;


@end

@implementation saveTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    
  //  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    UIButton *btn = (UIButton *)[cell viewWithTag:1];
    
    btn.backgroundColor = [UIColor grayColor];
    
    return cell;
}

#warning 没有想好
-(void)touchViewController:(TouchTableViewController *)viewController tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     //没有想好
}

- (IBAction)leftBtnTap:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
