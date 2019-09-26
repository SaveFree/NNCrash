//
//  NSMutableDictionary+ZAISafe.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSMutableDictionary+ZAISafe.h"
#import "NSObject+ZAISafeTools.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (ZAISafe)

+ (void)runSafeCode
{
    [NSObject zai_safe_exchangeInstanceMethod:objc_getClass("__NSDictionaryM")
                          method1Sel:@selector(setObject:forKey:)
                          method2Sel:@selector(zai_safe_setObject:forKey:)];
}

- (void)zai_safe_setObject:(id)anObject forKey:(id)aKey {
    if (anObject && aKey) {
        [self zai_safe_setObject:anObject forKey:aKey];
    }else
    {
#ifdef DEBUG
        NSLog(@"NSMutableDictionary setObject is error");
#endif
    }
}

@end
