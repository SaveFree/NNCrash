//
//  NSNotificationCenter+ZAISafe.m
//  NNCrash
//
//  Created by LST_PRO on 2017/11/1.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSNotificationCenter+ZAISafe.h"
#import "NSObject+ZAISafeTools.h"
#import <UIKit/UIKit.h>

@implementation NSNotificationCenter (ZAISafe)

+ (void)runSafeCode
{
    if ([UIDevice currentDevice].systemVersion.doubleValue < 9.0)
    {
        [NSObject zai_safe_exchangeInstanceMethod:[self class]
                              method1Sel:@selector(addObserver:selector:name:object:)
                              method2Sel:@selector(zai_safeAddObserver:selector:name:object:)];
    }
}

- (void)zai_safeAddObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject
{
    NSObject *obj = (NSObject *)observer;
    obj.zai_safe_notification_tag = ZAI_SAFE_NOTIFICATION_TAG;
    [self zai_safeAddObserver:observer selector:aSelector name:aName object:anObject];
}

@end
