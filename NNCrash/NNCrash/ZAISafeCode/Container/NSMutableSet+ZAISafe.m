//
//  NSMutableSet+ZAISafe.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSMutableSet+ZAISafe.h"
#import "NSObject+ZAISafeTools.h"
#import <objc/runtime.h>

@implementation NSMutableSet (ZAISafe)

+ (void)runSafeCode
{
    [NSObject zai_safe_exchangeInstanceMethod:objc_getClass("__NSSetM")
                          method1Sel:@selector(addObject:)
                          method2Sel:@selector(zai_safe_addObject:)];
}

- (void)zai_safe_addObject:(id)anObject
{
    if (anObject) {
        [self zai_safe_addObject:anObject];
    }else
    {
#ifdef DEBUG
        NSLog(@"NSMutableSet add is nil");
#endif
    }
}

@end
