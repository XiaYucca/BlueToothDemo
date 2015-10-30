//
//  ColoViewController.m
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/29.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "ColoViewController.h"
#import "leftButttonTableViewController.h"
@interface ColoViewController ()

//@property (strong ,nonatomic)NSArray *colerData;

@property (weak, nonatomic) IBOutlet UIView *imageBack;
@property (weak, nonatomic) IBOutlet UISlider *Rslider;
@property (weak, nonatomic) IBOutlet UISlider *Gslider;
@property (weak, nonatomic) IBOutlet UISlider *Bslider;
@property (strong ,nonatomic) NSDictionary *colorDict;

@end

@implementation ColoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.Gslider addTarget:self action:@selector(sliderValuechanged:) forControlEvents:UIControlEventValueChanged];
    [self.Rslider addTarget:self action:@selector(sliderValuechanged) forControlEvents:UIControlEventValueChanged];
    [self.Bslider addTarget:self action:@selector(sliderValuechanged) forControlEvents:UIControlEventValueChanged];
    
}



-(void)sliderValuechanged:(id)sender
{
    if (sender == self.Rslider) {
        [self.colorDict setValue: [NSString stringWithFormat:@"%f",self.Rslider.value] forKey:@"R"];
    }
    else if(sender == self.Gslider)
    {
        [self.colorDict setValue: [NSString stringWithFormat:@"%f",self.Gslider.value] forKey:@"G"];

    }
    else
    {
        [self.colorDict setValue: [NSString stringWithFormat:@"%f",self.Bslider.value] forKey:@"B"];

    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //sourceViewController
    ((leftButttonTableViewController *)segue.destinationViewController).colorDict = [self.colorDict mutableCopy];
}

@end
