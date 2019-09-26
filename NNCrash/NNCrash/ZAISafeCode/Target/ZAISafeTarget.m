//
//  ZAISafeTarget.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "ZAISafeTarget.h"
#import "ZAISafeForwardTargetObject.h"

@implementation ZAISafeTarget

+ (id)createFakeForwardTargetObject:(id)aTarget selector:(SEL)aSelector
{
    if ([[NSString string] respondsToSelector:aSelector]) {
        NSString *szTarget = nil;
        if ([aTarget isKindOfClass:[NSNumber class]]) {
            szTarget = [NSString stringWithFormat:@"%@", aTarget];
        }
        
        if (szTarget) {
            return szTarget;
        }
    }
    ZAISafeForwardTargetObject *substituteTaget = [[ZAISafeForwardTargetObject alloc] initWithSelector:aSelector];
    return substituteTaget;
}

@end
