//
//  signle.m
//  BlueToothDemo
//
//  Created by RainPoll on 15/10/28.
//  Copyright © 2015年 RainPoll. All rights reserved.
//

#import "SignleMode.h"
@class  SignleMode;

@implementation SignleMode

+(id)allocWithZone:(struct _NSZone *)zone
{
    static SignleMode *instance ;
    
    //线程是安全的 oneToken默认是0;
    static dispatch_once_t oneToken;
    
    // 在任何线程下只调用一次
    dispatch_once(&oneToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

+(instancetype)sharedSingleModels
{
   
    return [[self alloc]init];
}



@end
