//
//  NSObject+ZAISafe.m
//  NNCrash
//
///  kvo and notifiction  


//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "NSObject+ZAISafe.h"
#import "NSObject+ZAISafeTools.h"
#import "ZAISafeKVOCode.h"

@implementation NSObject (ZAISafe)

+ (void)runSafeKVOCode
{
    [NSObject zai_safe_exchangeInstanceMethod:[self class]
                          method1Sel:@selector(addObserver:forKeyPath:options:context:)
                          method2Sel:@selector(zai_safe_addObserver:forKeyPath:options:context:)];
    [NSObject zai_safe_exchangeInstanceMethod:[self class]
                          method1Sel:@selector(removeObserver:forKeyPath:)
                          method2Sel:@selector(zai_safe_removeObserver:forKeyPath:)];
    [NSObject zai_safe_exchangeInstanceMethod:[self class]
                          method1Sel:@selector(observeValueForKeyPath:ofObject:change:context:)
                          method2Sel:@selector(zai_safe_observeValueForKeyPath:ofObject:change:context:)];
    [NSObject zai_safe_exchangeInstanceMethod:[self class]
                          method1Sel:@selector(removeObserver:forKeyPath:context:)
                          method2Sel:@selector(zai_safe_removeObserver:forKeyPath:context:)];
}
- (void)zai_safe_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    if (![[ZAISafeKVOCode shareInstance] isMapObserver:observer inkeySource:self keyPath:keyPath])
    {
        observer.zai_safe_kvo_tag = ZAI_SAFE_KVO_TAG;
        ZAISafeKVOResource *resource = [[ZAISafeKVOResource alloc] initWithResource:self observer:observer key:keyPath];
        [[ZAISafeKVOCode shareInstance] addObserver:observer source:resource];
        [self zai_safe_addObserver:observer forKeyPath:keyPath options:options context:context];
    }
}
- (void)zai_safe_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    if ([[ZAISafeKVOCode shareInstance] observerRemove:observer inkeySource:self keyPath:keyPath]) {
        [self zai_safe_removeObserver:observer forKeyPath:keyPath];
    }
}
- (void)zai_safe_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context
{
    if ([[ZAISafeKVOCode shareInstance] observerRemove:observer inkeySource:self keyPath:keyPath]) {
        [self zai_safe_removeObserver:observer forKeyPath:keyPath context:context];
    }
}
- (void)zai_safe_observeValueForKeyPath:(NSString *)keyPath
                          ofObject:(id)object
                            change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                           context:(void *)context
{
    if (![[ZAISafeKVOCode shareInstance] observeValueForKeyPath:object inkeySource:self keyPath:keyPath]) {
        [self zai_safe_observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
