//
//  ListView.m
//  blueToothLED
//
//  Created by RainPoll on 15/10/27.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "ListView.h"
#import "JLScaleAnimation.h"

@interface ListView () <UITableViewDelegate ,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (weak, nonatomic) IBOutlet UIButton *connectButton;
@property (weak, nonatomic) IBOutlet UIButton *connectAllButton;
@property (weak, nonatomic) IBOutlet UIButton *cansaleButton;
@property (nonatomic ,strong )NSMutableArray *tableItems;

@end

@implementation ListView


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    
    self.tableItems = [NSMutableArray array];
    
    [self.cansaleButton addTarget:self action:@selector(cansaleButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.connectButton addTarget:self action:@selector(connectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.connectAllButton addTarget:self action:@selector(connectAllButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    [self addObserver:self forKeyPath:@"tableItems" options:NSKeyValueObservingOptionNew context:nil];
    
    NSLog(@"listViewButton --%@",self.cansaleButton);
    
    return self;
}

-(void)setTableItems:(NSMutableArray *)tableItems
{
   // NSLog(@"重写的方法没有调用");
    if (_tableItems != tableItems) {
        _tableItems = tableItems;
        [self.TableView reloadData];
    }
}


-(void)addPeripheral:(NSString *)peripheral
{   bool canAdd = YES;
    for (NSString *name in self.tableItems) {
        if ([name isEqualToString:peripheral]) {
            canAdd = NO;
        }
    }
    if (canAdd == YES) {
        [self.tableItems addObject:peripheral];
      //  NSLog(@"可以添加");
        [self.TableView reloadData];
    }
}


#pragma mark - 自定义代理方法调用系统

-(IBAction)cansaleButton:(id)sender
{
 //   NSLog(@"调用了自定义代理方法");
    if ( self.delegate && [self.delegate respondsToSelector:@selector(listView:cansaleButtonTap:)]){
        [self.delegate listView:self cansaleButtonTap:sender];
    }
}

-(IBAction)connectButton: (id)sender
{
    if ( self.delegate && [self.delegate respondsToSelector:@selector(listView:connectButtonTap:)]){
        [self.delegate listView:self connectButtonTap:sender];
    }
}

-(IBAction)connectAllButton: (id)sender
{
    if ( self.delegate && [self.delegate respondsToSelector:@selector(listView:connectAllButtonTap:)]){
        [self.delegate listView:self connectAllButtonTap:sender];
    }
}



//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    NSLog(@"KVO 工作了");
//}

#pragma mark - 点击事件方法

-(void)hideListView
{
    [JLScaleAnimation scaleAnimationHideForView:self completionHandler:^{
        [self removeFromSuperview];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 //   NSLog(@"listView delegate ");
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"listView delegate  %lu",(unsigned long)self.tableItems.count);
    return self.tableItems.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    NSString *txt = self.tableItems[indexPath.row];
    cell.textLabel.text = txt;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选择了 %@cell",indexPath);
    
    if ([self.delegate respondsToSelector:@selector(lisView:tableView:didSelectRowAtIndexPath:)]) {
        
        [self.delegate lisView:self tableView:tableView didSelectRowAtIndexPath:indexPath];
   
    }
}


-(void)cansaleButtonTap:(id)sender
{
  //  NSLog(@"ListView取消键");
    
    [self hideListView];
}




@end
