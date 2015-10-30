//
//  ListView.h
//  blueToothLED
//
//  Created by RainPoll on 15/10/27.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListView ;
@protocol listViewDelegate <NSObject>

-(void)lisView:(ListView *)listView tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)listView :(ListView *)listView cansaleButtonTap:(UIButton *)sender;

-(void)listView:(ListView *)listView  connectButtonTap:(UIButton *)sender;

-(void)listView:(ListView *)listView connectAllButtonTap:(UIButton *)sender;

@end

@interface ListView : UIView

@property (nonatomic ,weak)id<listViewDelegate>delegate;

-(void)hideListView;
-(void)addPeripheral:(NSString *)peripheral;
@end


