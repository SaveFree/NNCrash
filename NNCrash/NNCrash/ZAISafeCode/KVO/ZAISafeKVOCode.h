//
//  ZAISafeKVOCode.h
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZAISafeKVOResource.h"

@interface ZAISafeKVOCode : NSObject

+ (ZAISafeKVOCode *)shareInstance;

- (void)addObserver:(id)observer source:(ZAISafeKVOResource *)source;
- (BOOL)isMapObserver:(id)observer inkeySource:(id)keySource keyPath:(NSString*)path;
- (BOOL)observerRemove:(id)observer inkeySource:(id)keySource keyPath:(NSString*)path;
- (BOOL)observeValueForKeyPath:(id)observer inkeySource:(id)keySource keyPath:(NSString*)path;
- (void)removeAllObserver:(id)source;

@end
