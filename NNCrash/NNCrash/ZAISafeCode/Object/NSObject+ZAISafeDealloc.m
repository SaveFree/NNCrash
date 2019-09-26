//
//  NSObject+ZAISafeDealloc.m
//  NNCrash
//
//  Created by LST_PRO on 2017/11/8.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSObject+ZAISafeDealloc.h"
#import "NSObject+ZAISafeTools.h"
#import "ZAISafeKVOCode.h"
#import <UIKit/UIKit.h>

@implementation NSObject (ZAISafeDealloc)

+ (void)runSafeDeallocCode
{
    [NSObject zai_safe_exchangeInstanceMethod:[self class]
                          method1Sel:sel_getUid("dealloc")
                          method2Sel:sel_getUid("zai_safeCodeDealloc")];
}
- (void)zai_safeCodeDealloc
{
    if ([self.zai_safe_kvo_tag isEqualToString:ZAI_SAFE_KVO_TAG])
    {
        [[ZAISafeKVOCode shareInstance] removeAllObserver:self];
    }
    if ([self.zai_safe_notification_tag isEqualToString:ZAI_SAFE_NOTIFICATION_TAG] &&
        [UIDevice currentDevice].systemVersion.doubleValue < 9.0)
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    [self zai_safeCodeDealloc];
}
@end
