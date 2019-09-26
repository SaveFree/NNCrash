//
//  NSTimer+ZAISafe.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSTimer+ZAISafe.h"
#import "ZAISafeTimerBridge.h"
#import "NSObject+ZAISafeTools.h"

@implementation NSTimer (ZAISafe)

+ (void)runSafeTimerCode
{
    [NSObject zai_safe_exchangeClassMethod:[self class]
                          method1Sel:@selector(scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:)
                          method2Sel:@selector(zai_safeScheduledTimerWithTimeInterval:target:selector:userInfo:repeats:)];
}

+ (NSTimer *)zai_safeScheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo
{
    ZAISafeTimerBridge *bridge = [[ZAISafeTimerBridge alloc] init];
    bridge.target = aTarget;
    bridge.selector = aSelector;
    bridge.timer = [self zai_safeScheduledTimerWithTimeInterval:ti target:bridge selector:@selector(timeSelector:) userInfo:userInfo repeats:yesOrNo];
    return bridge.timer;
}
@end
