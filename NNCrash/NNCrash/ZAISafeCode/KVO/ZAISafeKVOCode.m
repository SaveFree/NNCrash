//
//  ZAISafeKVOCode.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "ZAISafeKVOCode.h"

@interface ZAISafeKVOCode ()

@property (nonatomic, strong) NSMutableDictionary *kvoMap;
@property (nonatomic, strong) NSLock              *kvoMapLock;

@end

@implementation ZAISafeKVOCode
+ (ZAISafeKVOCode *)shareInstance
{
    static dispatch_once_t onceToken;
    static ZAISafeKVOCode *shareInstance;
    
    dispatch_once(&onceToken, ^{
        shareInstance = [[ZAISafeKVOCode alloc] init];
    });
    
    return shareInstance;
}

- (instancetype)init
{
    if (self = [super init]) {
        _kvoMap = [NSMutableDictionary dictionary];
        _kvoMapLock = [[NSLock alloc] init];
    }
    return self;
}
- (void)addObserver:(id)observer source:(ZAISafeKVOResource *)source
{
    if (nil == observer || nil == source) {
        return;
    }
    NSString *key = [NSString stringWithFormat:@"%@_%p",NSStringFromClass([observer class]),observer];
    [self.kvoMapLock lock];
    if ([self.kvoMap objectForKey:key]) {
        id obj = [self.kvoMap objectForKey:key];
        if ([obj isKindOfClass:[NSArray class]]) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:obj];
            if (![array containsObject:source]) {
                [array addObject:source];
                [self.kvoMap setObject:array forKey:key];
            }
        }
    }else{
        NSMutableArray *array = [NSMutableArray arrayWithObject:source];
        [self.kvoMap setObject:array forKey:key];
    }
    [self.kvoMapLock unlock];
}

- (BOOL)isMapObserver:(id)observer inkeySource:(id)keySource keyPath:(NSString*)path
{
    NSString *key = [NSString stringWithFormat:@"%@_%p",NSStringFromClass([observer class]),observer];
    [self.kvoMapLock lock];
    id obj = [self.kvoMap objectForKey:key];
    if ([obj isKindOfClass:[NSMutableArray class]]) {
        for (id source in obj) {
            if ([source isKindOfClass:[ZAISafeKVOResource class]]) {
                if ([(ZAISafeKVOResource*)source resource] == keySource && [(ZAISafeKVOResource*)source key] == path) {
                    [self.kvoMapLock unlock];
                    return YES;
                }
            }
        }
    }
    [self.kvoMapLock unlock];
    return NO;
}
- (BOOL)observerRemove:(id)observer inkeySource:(id)keySource keyPath:(NSString*)path
{
    NSString *key = [NSString stringWithFormat:@"%@_%p",NSStringFromClass([observer class]),observer];
    [self.kvoMapLock lock];
    id obj = [self.kvoMap objectForKey:key];
    if ([obj isKindOfClass:[NSMutableArray class]]) {
        for (id source in obj) {
            if ([source isKindOfClass:[ZAISafeKVOResource class]]) {
                if ([(ZAISafeKVOResource*)source resource] == keySource && [(ZAISafeKVOResource*)source key] == path) {
                    [obj removeObject:source];
                    [self.kvoMapLock unlock];
                    return YES;
                }
            }
        }
    }
    [self.kvoMapLock unlock];
    return NO;
}
- (BOOL)observeValueForKeyPath:(id)observer inkeySource:(id)keySource keyPath:(NSString*)path
{
    NSString *key = [NSString stringWithFormat:@"%@_%p",NSStringFromClass([observer class]),observer];
    [self.kvoMapLock lock];
    id obj = [self.kvoMap objectForKey:key];
    if ([obj isKindOfClass:[NSMutableArray class]]) {
        for (id source in obj) {
            if ([source isKindOfClass:[ZAISafeKVOResource class]]) {
                if ([(ZAISafeKVOResource*)source resource] == nil && [(ZAISafeKVOResource*)source key] == path) {
                    [obj removeObject:source];
                    [self.kvoMapLock unlock];
                    return YES;
                }
            }
        }
    }
    [self.kvoMapLock unlock];
    return NO;
}
- (void)removeAllObserver:(id)source
{
    [self.kvoMapLock lock];
    [self.kvoMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSMutableArray *obj, BOOL * _Nonnull stop) {
        for (id resource in obj) {
            if ([resource isKindOfClass:[ZAISafeKVOResource class]]) {
                NSLog(@"%@", [(ZAISafeKVOResource*)resource observer]);
                NSLog(@"%@", source);
                if ([(ZAISafeKVOResource*)resource observer] == source || [(ZAISafeKVOResource*)resource observer] == NULL) {
                    [[(ZAISafeKVOResource*)resource resource] removeObserver:source forKeyPath:[(ZAISafeKVOResource*)resource key]];
                    *stop = YES;
                }
            }
        }
    }];
    [self.kvoMapLock unlock];
}

@end
