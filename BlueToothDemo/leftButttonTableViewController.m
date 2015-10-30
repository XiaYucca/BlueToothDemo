//
//  leftButttonTableViewController.m
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/28.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "leftButttonTableViewController.h"
#import "JLPopoverController.h"
#import "TouchTableViewController.h"
@interface leftButttonTableViewController () <TouchTableViewControllerDelegate>
- (IBAction)button:(id)sender;
- (IBAction)switch:(id)sender;
- (IBAction)btnClick:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)backBtn:(id)sender;

@property (nonatomic,strong)NSIndexPath *indexPath;

@end

@implementation leftButttonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)switch:(id)sender {
}
- (IBAction)btnClick:(UIButton *)sender forEvent:(UIEvent *)event {
 
    
    TouchTableViewController *touch = [[TouchTableViewController alloc]init];
    
    touch.delegate = self;
    
    JLPopoverController * coller = [[JLPopoverController alloc]initWithContentViewController:touch];
    
    [coller showPopoverWithTouch: event];
}

- (IBAction)backBtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchViewController:(TouchTableViewController *)viewController tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableViewTouch  %@",indexPath);
    self.indexPath = indexPath;
}


@end
