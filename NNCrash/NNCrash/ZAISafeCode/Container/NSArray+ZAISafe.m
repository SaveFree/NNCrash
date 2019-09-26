//
//  NSArray+ZAISafe.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSArray+ZAISafe.h"
#import "NSObject+ZAISafeTools.h"
#import <objc/runtime.h>

@implementation NSArray (ZAISafe)

+ (void)runSafeCode
{
    [NSObject zai_safe_exchangeInstanceMethod:objc_getClass("__NSArrayI")
                          method1Sel:@selector(objectAtIndex:)
                          method2Sel:@selector(zai_safe_objectAtIndex:)];
}

- (id)zai_safe_objectAtIndex:(NSInteger)index
{
    if (index < self.count) {
        return  [self zai_safe_objectAtIndex:index];
    }else
    {
#ifdef DEBUG
        NSLog(@"NSArray objectAtIndex is error");
#endif
    }
    return nil;
}


@end
