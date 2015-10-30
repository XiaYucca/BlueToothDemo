//
//  tempViewController.h
//  blueToothLED
//
//  Created by RainPoll on 15/10/27.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tempViewController : UIViewController

-(void)transformRGBDataWithBlock:(void(^)(UIColor *color))colorBlock;

@end
