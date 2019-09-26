//
//  NSObject+ZAISafeTools.h
//  NNCrash
//
//  Created by LST_PRO on 2017/11/7.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* const ZAI_SAFE_KVO_TAG               = @"10000";
static NSString* const ZAI_SAFE_NOTIFICATION_TAG      = @"10001";

@interface NSObject (ZAISafeTools)

@property(nonatomic, strong) NSString *zai_safe_kvo_tag;
@property(nonatomic, strong) NSString *zai_safe_notification_tag;

+ (void)zai_safe_exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;
+ (void)zai_safe_exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;
@end
