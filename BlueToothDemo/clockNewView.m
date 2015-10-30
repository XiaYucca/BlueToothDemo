//
//  clockNewView.m
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/28.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "clockNewView.h"



@implementation clockNewView

//-(instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    return self;
//}

+(instancetype)clockView
{
       clockNewView *newView = [[[NSBundle mainBundle]loadNibNamed:@"clockButtomView" owner:self options:nil]firstObject];
    
    UIDatePicker *p = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 37, 375, 185)];
    [newView addSubview:p];
    return newView;
}



- (IBAction)doneBtnClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(clockNew:DoneBtnClick:)]) {
        [self.delegate clockNew:self DoneBtnClick:sender];
    }
}

- (IBAction)cansaleBtnClick:(id)sender {
    NSLog(@"底层的代理方法");
    if ([self.delegate respondsToSelector:@selector(clockNew:CansaleBtnClick:)]) {
        [self.delegate clockNew:self CansaleBtnClick:sender];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
