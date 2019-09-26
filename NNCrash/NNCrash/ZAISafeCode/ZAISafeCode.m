//
//  ZAISafeCode.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "ZAISafeCode.h"
#import "NSObject+ZAISafe.h"
#import "ZAISafeContainerCode.h"
#import "NSObject+ZAISafeTarget.h"
#import "NSTimer+ZAISafe.h"
#import "NSNotificationCenter+ZAISafe.h"
#import "NSObject+ZAISafeDealloc.h"

@implementation ZAISafeCode

+ (void)runSafeCodeWithType:(ZAISafeCodeType)type
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (type & ZAISafeCodeType_KVO) {
            [NSObject runSafeKVOCode];
        }
        if (type & ZAISafeCodeType_Notification) {
            [NSNotificationCenter runSafeCode];
        }
        if (type & ZAISafeCodeType_Target) {
            [NSObject runSafeTargetCode];
        }
        if (type & ZAISafeCodeType_Timer) {
            [NSTimer runSafeTimerCode];
        }
        if (type & ZAISafeCodeType_Container) {
            [ZAISafeContainerCode runSafeCode];
        }
        if (type & ZAISafeCodeType_KVO || type & ZAISafeCodeType_Notification) {
            [NSObject runSafeDeallocCode];
        }
    });
}
@end
