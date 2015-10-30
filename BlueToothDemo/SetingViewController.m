//
//  SetingViewController.m
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/29.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "SetingViewController.h"
#import "ListView.h"
#import "JLScaleAnimation.h"
#import "JLProgressHUD.h"

@interface SetingViewController ()<listViewDelegate>

@property (nonatomic, strong)ListView *list;

@property (nonatomic,strong )NSTimer *timer;

@end

@implementation SetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)timerOut
{
    NSLog(@"timeOUt");
    
    static int i = 1;
    
    NSLog(@"按下了");
    
    NSString *str = [NSString stringWithFormat:@"测试设备%d",i++];
    
    if (i == 6 ) {
        [self.timer invalidate];
    }
    
    [self.list addPeripheral:str];
    
    
}


#pragma mark - listView的方法

-(void)lisView:(ListView *)listView tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(void)listView :(ListView *)listView cansaleButtonTap:(UIButton *)sender
{
    NSLog(@"取消");
   [self.list hideListView];
    
}

-(void)listView:(ListView *)listView  connectButtonTap:(UIButton *)sender
{
    NSLog(@"按下了");
    
    UIAlertController * alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否连接" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action =  [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"确定连接了");
        // 又开始转了
        [JLProgressHUD showHUDAddedTo:self.view animated:YES];
        
        [JLProgressHUD hideHUDForView:self.view animated:YES afterDelay:3.0];
        
    }];
    
    UIAlertAction *actionCansal =  [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消连接");
    }];
    
    [alter addAction: action];
    [alter addAction: actionCansal];
    
    [self presentViewController:alter animated:YES completion:nil];
}

-(void)listView:(ListView *)listView connectAllButtonTap:(UIButton *)sender
{
    
}

-(IBAction)breakClick:(id)sender
{
    
}

-(IBAction)reconnectClick:(id)sender
{
    ListView *list = [[[NSBundle mainBundle]loadNibNamed:@"ListView" owner:nil options:nil]firstObject];
    
    list.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    
    [self.view addSubview:list];
    
    list.delegate = self;
    
    self.list = list;
    
    [JLScaleAnimation scaleAnimationShowForView:list completionHandler:^{
        //显示 菊花转圈
        [JLProgressHUD showHUDAddedTo:self.view animated:YES];
        
        [JLProgressHUD hideHUDForView:self.view animated:YES afterDelay:3.0];
        
    }];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerOut) userInfo:nil repeats:YES];

}

@end
