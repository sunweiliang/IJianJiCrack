//
//  HookHeader.h
//  iThunder
//
//  Created by iOS-dev on 2018/2/13.
//  Copyright © 2018年 weiliang.sun. All rights reserved.
//

#ifndef HookHeader_h
#define HookHeader_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SWLTools.h"

@interface RegisterAViewController :UIViewController

@property(nonatomic) __weak UIButton *toRegBtn; // @synthesize toRegBtn=_toRegBtn;
@property(nonatomic) __weak UITextField *promoCodeTextField; // @synthesize promoCodeTextField=_promoCodeTextField;
@property(nonatomic) __weak UITextField *confPswTextField; // @synthesize confPswTextField=_confPswTextField;
@property(nonatomic) __weak UITextField *pswTextField; // @synthesize pswTextField=_pswTextField;
@property(nonatomic) __weak UITextField *userNameTextField; //

@end



@interface AppDelegate : UIResponder

+(id)getDeviceId;

@end


#endif /* HookHeader_h */
