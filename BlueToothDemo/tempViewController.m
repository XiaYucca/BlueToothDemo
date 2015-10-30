//
//  tempViewController.m
//  blueToothLED
//
//  Created by RainPoll on 15/10/27.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "tempViewController.h"
#import "saveTableViewViewController.h"
#import "SetingViewController.h"
#import "leftButttonTableViewController.h"

@interface tempViewController ()

@property (weak, nonatomic) IBOutlet UIView *imageViewBack;

@property (strong ,nonatomic)NSDictionary *temp;
@property (strong ,nonatomic)UIColor *color;

@property (strong ,nonatomic)NSMutableDictionary *tempDict;



- (IBAction)ligthAdgust:(id)sender;

- (IBAction)tempAdgust:(id)sender;
- (IBAction)saveButton:(id)sender;

@end

@implementation tempViewController

-(NSDictionary *)temp
{
    if (_temp == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"Temps" ofType:@"plist"];
        _temp = [NSDictionary dictionaryWithContentsOfFile:path];
        
    }
    return _temp;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSLog(@"tempPlist = %@",self.temp);
    
    self.tempDict = [@{}mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)ligthAdgust:(UISlider *)sender {
   
    self.imageViewBack.alpha = sender.value/100.0;
    
    
}

-(void)transformRGBDataWithBlock:(void(^)(UIColor *color))colorBlock
{
     colorBlock(self.color);
}


- (IBAction)tempAdgust:(UISlider *)sender {
    NSLog(@"调节冷暖");
    
    
    NSString * str = [NSString stringWithFormat:@"%d",(int)sender.value];
    
    NSDictionary *temp = self.temp[str];
    
    //  NSLog(@"%@",temp);
    
    float R = [temp[@"R"] floatValue];
    float G = [temp[@"G"] floatValue];
    float B = [temp[@"B"] floatValue];
    
    
    UIColor *color = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:0.5];
    
    self.color = color;
    
    self.imageViewBack.backgroundColor = color;
    
    self.tempDict = [temp mutableCopy];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.destinationViewController isKindOfClass: [leftButttonTableViewController class]]) {
        
        NSLog(@"数据有传过去");
        
        UINavigationController *temp = (UINavigationController *)segue.destinationViewController;
        
        leftButttonTableViewController *dest = temp.viewControllers[0];
        
        dest.colorDict = [self.temp copy];
        
    }
    else
    {
        NSLog(@"不要崩啊");
        
        UINavigationController *temp = (UINavigationController *)segue.destinationViewController;
        
        saveTableViewViewController *dest = temp.viewControllers[0];
        
        dest.tempDict = [self.temp copy];
    
    }
    
}


- (IBAction)saveButton:(id)sender {
    
//    saveTableViewController *saveView = [[saveTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
//    [self presentViewController:saveView animated:YES completion:nil];
}
@end
