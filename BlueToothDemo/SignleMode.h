//
//  signle.h
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/28.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignleMode : NSObject

@property (strong ,nonatomic)NSArray *clocks;

@property (strong ,nonatomic)NSArray *colors;

@property (strong ,nonatomic)NSArray *tempClocks;


+(instancetype)sharedSingleModels;
@end
