//
//  NSMutableArray+ZAISafe.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSMutableArray+ZAISafe.h"
#import "NSObject+ZAISafeTools.h"
#import <objc/runtime.h>

@implementation NSMutableArray (ZAISafe)

+ (void)runSafeCode
{
    [NSObject zai_safe_exchangeInstanceMethod:objc_getClass("__NSArrayM")
                          method1Sel:@selector(addObject:)
                          method2Sel:@selector(zai_safe_addObject:)];
    [NSObject zai_safe_exchangeInstanceMethod:objc_getClass("__NSArrayM")
                          method1Sel:@selector(insertObject:atIndex:)
                          method2Sel:@selector(zai_safe_insertObject:atIndex:)];
    [NSObject zai_safe_exchangeInstanceMethod:objc_getClass("__NSArrayM")
                          method1Sel:@selector(removeObjectAtIndex:)
                          method2Sel:@selector(zai_safe_removeObjectAtIndex:)];
    [NSObject zai_safe_exchangeInstanceMethod:objc_getClass("__NSArrayM")
                          method1Sel:@selector(replaceObjectAtIndex:withObject:)
                          method2Sel:@selector(zai_safe_replaceObjectAtIndex:withObject:)];
}


- (void)zai_safe_addObject:(id)anObject
{
    if (anObject) {
        [self zai_safe_addObject:anObject];
    }else
    {
#ifdef DEBUG
        NSLog(@"NSMutableArray add is nil");
#endif
    }
}
- (void)zai_safe_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && (index <= self.count)) {
        [self zai_safe_insertObject:anObject atIndex:index];
    }else
    {
#ifdef DEBUG
        NSLog(@"NSMutableArray insert is error");
#endif
    }
}
- (void)zai_safe_removeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        [self zai_safe_removeObjectAtIndex:index];
    }else
    {
#ifdef DEBUG
        NSLog(@"NSMutableArray remove is error");
#endif
    }
}

- (void)zai_safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if ((index < self.count) && anObject) {
        [self zai_safe_replaceObjectAtIndex:index withObject:anObject];
    }else
    {
#ifdef DEBUG
        NSLog(@"NSMutableArray replace is error");
#endif
    }
}

@end
