//
//  ZAISafeForwardTargetObject.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "ZAISafeForwardTargetObject.h"
#import <objc/runtime.h>

id fakeIMP(id sender,SEL sel,...){
    return nil;
}

@implementation ZAISafeForwardTargetObject

- (instancetype)initWithSelector:(SEL)aSelector
{
    if (self = [super init]) {
        if(class_addMethod([self class], aSelector, (IMP)fakeIMP, NULL)) {
#ifdef DEBUG
            NSLog(@"add selector%@", NSStringFromSelector(aSelector));
#endif
        }
    }
    
    return self;
}

@end
