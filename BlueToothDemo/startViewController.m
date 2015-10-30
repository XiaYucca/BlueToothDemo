//
//  startViewController.m
//  blueToothLED
//
//  Created by RainPoll on 15/10/26.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "startViewController.h"
#import "JLProgressHUD.h"
#import "JLScaleAnimation.h"
#import "ListView.h"
#import "JLBLEManager.h"
#import "SignleMode.h"

@interface startViewController ()<listViewDelegate,JLBLEManagerDelegate>

@property (nonatomic, strong)ListView *list;

@property (nonatomic,strong )NSTimer *timer;

@end

@implementation startViewController

-(void)viewDidLoad
{
    JLBLEManager *manage = [JLBLEManager sharedBLEManager];
    
    manage.delegate = self;
    
    [manage findPeripherals];
    
}


- (IBAction)searchButtonTag:(id)sender {
    
    NSLog(@"sss");
//
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 80, 80)];
//    
//    view.backgroundColor = [UIColor redColor];
//
//    [self.view addSubview:view];
    
//    [JLScaleAnimation scaleAnimationHideForView:self.view completionHandler:^{
//        
//    }];
    
    ListView *list = [[[NSBundle mainBundle]loadNibNamed:@"ListView" owner:nil options:nil]firstObject];
    
    list.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    
    [self.view addSubview:list];
    
    list.delegate = self;
//    
//    [list.connectButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [list.cansaleButton addTarget:self action:@selector(cansaleButtonTap:) forControlEvents:UIControlEventTouchUpInside];
      self.list = list;
    
    [JLScaleAnimation scaleAnimationShowForView:list completionHandler:^{
       //显示 菊花转圈
        [JLProgressHUD showHUDAddedTo:self.view animated:YES];
        
        [JLProgressHUD hideHUDForView:self.view animated:YES afterDelay:3.0];

    }];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerOut) userInfo:nil repeats:YES];
}

-(void)timerOut
{
    NSLog(@"timeOUt");
    
    static int i = 1;
    
   // NSLog(@"按下了");
    
    NSString *str = [NSString stringWithFormat:@"测试设备%d",i++];
    
    if (i == 6 ) {
        [self.timer invalidate];
    }
    
    [self.list addPeripheral:str];
    
}


-(void)listView :(ListView *)listView cansaleButtonTap:(UIButton *)sender
{
    NSLog(@"取消");
    [self.list hideListView];
    UITabBarController * tabBar = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
    
    [self presentViewController:tabBar animated:YES completion:nil];

    
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

#pragma  mark - manage代理方法
- (void)bleManagerDidFindPeripherals
{
   // NSLog(@"找到的外设设备是%@",[JLBLEManager sharedBLEManager].peripheralName);
    
    [[JLBLEManager sharedBLEManager] connectPeripherals];
}

- (void)bleManagerDidConnectPeripherals
{
    NSLog(@"连接完成%@",[[JLBLEManager sharedBLEManager] foundPeripherals]);
}

- (void)bleManagerDidDisconnectPeripherals
{
    
}


- (void)bleManagerWithModules:(NSSet *)modules
{
    NSLog(@"  ----->%@",modules);
}

- (void)bleManagerWithClocks:(NSArray *)clocks
{
    if (clocks) {
        NSLog(@"%@",clocks);
       [SignleMode sharedSingleModels].clocks = [clocks copy];
    }
}

- (void)bleManagerWithColors:(NSArray *)colors
{
    if (colors) {
        NSLog(@"%@",colors);
       [SignleMode sharedSingleModels].colors = [colors copy];
    }
}

- (void)bleManagerWithTempClocks:(NSArray *)tempClocks
{
    if (tempClocks) {
        NSLog(@"%@",tempClocks);
        [SignleMode sharedSingleModels].tempClocks = [tempClocks copy];
    }
}

/**
-(void)btnClick:(id)sender
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

-(void)cansaleButtonTap:(id)sender
{
    NSLog(@"取消");
    [self.list hideListView];
    
    UITabBarController * tabBar = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
    
    [self presentViewController:tabBar animated:YES completion:nil];
    
}

*/


@end
