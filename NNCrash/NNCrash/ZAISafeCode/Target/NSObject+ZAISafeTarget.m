//
//  NSObject+ZAISafeTarget.m
//  NNCrash
//
//  Created by LST_PRO on 2017/11/8.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSObject+ZAISafeTarget.h"
#import "NSObject+ZAISafeTools.h"
#import "ZAISafeTarget.h"

@implementation NSObject (ZAISafeTarget)

+ (void)runSafeTargetCode
{
    [NSObject zai_safe_exchangeInstanceMethod:[self class]
                          method1Sel:@selector(forwardingTargetForSelector:)
                          method2Sel:@selector(zai_safe_forwardingTargetForSelector:)];
}
- (id)zai_safe_forwardingTargetForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if ([self respondsToSelector:aSelector] || signature) {
        return [self zai_safe_forwardingTargetForSelector:aSelector];
    }
    return [ZAISafeTarget createFakeForwardTargetObject:self selector:aSelector];
}
@end
