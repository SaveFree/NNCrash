//
//  ZAISafeTimerBridge.h
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZAISafeTimerBridge : NSObject

@property (nonatomic, weak)   id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak)   NSTimer* timer;

- (void)timeSelector:(NSTimer *)timer;

@end
