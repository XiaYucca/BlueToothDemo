//
//  TouchTableViewController.h
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/28.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TouchTableViewController;
@protocol TouchTableViewControllerDelegate <NSObject>

@optional
-(void)touchViewController:(TouchTableViewController *)viewController tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface TouchTableViewController : UITableViewController
@property (nonatomic, strong)UIView *touchEventView;
@property (nonatomic, strong)NSString *dataArr;
@property (nonatomic , weak)id<TouchTableViewControllerDelegate>delegate;

-(void)touchTableViewdidSelectRowAtIndexPathWithBlock:(void(^)(UITableView *tableView, NSIndexPath *indexPath ,UITableViewCell *cell))Block;

@end
