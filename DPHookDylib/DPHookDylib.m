//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  DPHookDylib.m
//  DPHookDylib
//
//  Created by iOS-dev on 2018/3/7.
//  Copyright (c) 2018年 weiliang.sun. All rights reserved.
//

#import "DPHookDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import "HookHeader.h"
#import "NSString+SWL.h"

static __attribute__((constructor)) void entry(){
    NSLog(@"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍");
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
#ifndef __OPTIMIZE__
        CYListenServer(6666);
#endif
        
    }];
}

@interface CustomViewController

-(NSString*)getMyName;

@end

CHDeclareClass(CustomViewController)

CHOptimizedMethod(0, self, NSString*, CustomViewController,getMyName){
    //get origin value
    NSString* originName = CHSuper(0, CustomViewController, getMyName);
    
    NSLog(@"origin name is:%@",originName);
    
    //get property
    NSString* password = CHIvar(self,_password,__strong NSString*);
    
    NSLog(@"password is %@",password);
    
    //change the value
    return @"AloneMonkey";
    
}



#pragma mark - AppDelegate
CHDeclareClass(AppDelegate)
CHOptimizedMethod(2, self, BOOL, AppDelegate,application,id,arg1,didFinishLaunchingWithOptions,id,arg2){
    BOOL result = CHSuper(2,AppDelegate,application,arg1,didFinishLaunchingWithOptions,arg2);
    
    [[NSUserDefaults standardUserDefaults] setObject:@"com.aijianji.001" forKey:@"com.aijianji.001"];
    [[NSUserDefaults standardUserDefaults] setObject:@"com.aijianji.002" forKey:@"com.aijianji.002"];
    [[NSUserDefaults standardUserDefaults] setObject:@"com.aijianji.003" forKey:@"com.aijianji.003"];
    [[NSUserDefaults standardUserDefaults] setObject:@"com.aijianji.004" forKey:@"com.aijianji.004"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return result;
}



CHConstructor{
    
    CHLoadLateClass(AppDelegate);
    CHClassHook(2, AppDelegate, application,didFinishLaunchingWithOptions);
    
}




