//
//  clockNewView.h
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/28.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import <UIKit/UIKit.h>
@class clockNewView;
@protocol clockNewViewDelegate <NSObject>

@optional

- (void)clockNew:(clockNewView *)view  DoneBtnClick:(id)sender;

- (void)clockNew:(clockNewView *)view  CansaleBtnClick:(id)sender;

//- (IBAction)clockNew:(clockNewView *)view datePick:(id)sender;

@end

@interface clockNewView : UIView

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) id<clockNewViewDelegate>delegate;
+(instancetype)clockView;

@end
