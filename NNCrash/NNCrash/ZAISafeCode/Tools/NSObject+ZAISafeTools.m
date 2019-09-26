//
//  NSObject+ZAISafeTools.m
//  NNCrash
//
//  Created by LST_PRO on 2017/11/7.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSObject+ZAISafeTools.h"
#import <objc/runtime.h>

static const void *ZAISAFENOTIFICATIONTAGSTATIC  = "zai_safe_notification_tag";
static const void *ZAISAFEKVOTAGSTATIC           = "zai_safe_kvo_tag";

@implementation NSObject (ZAISafeTools)

-(NSString *)zai_safe_notification_tag {
    return objc_getAssociatedObject(self, ZAISAFENOTIFICATIONTAGSTATIC);
}

-(void)setZai_safe_notification_tag:(NSString *)zai_safe_notification_tag {
    objc_setAssociatedObject(self, ZAISAFENOTIFICATIONTAGSTATIC, zai_safe_notification_tag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)zai_safe_kvo_tag {
    return objc_getAssociatedObject(self, ZAISAFEKVOTAGSTATIC);
}

-(void)setZai_safe_kvo_tag:(NSString *)zai_safe_kvo_tag {
    objc_setAssociatedObject(self, ZAISAFEKVOTAGSTATIC, zai_safe_kvo_tag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)zai_safe_exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel
{
    Method originalMethod = class_getInstanceMethod(anClass, method1Sel);
    Method swizzledMethod = class_getInstanceMethod(anClass, method2Sel);
    
    BOOL didAddMethod = class_addMethod(anClass,
                    method1Sel,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(anClass,
                            method2Sel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}
+ (void)zai_safe_exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel
{
    Class class2 = object_getClass(anClass);
    [NSObject zai_safe_exchangeInstanceMethod:class2 method1Sel:method1Sel method2Sel:method2Sel];
}

@end
