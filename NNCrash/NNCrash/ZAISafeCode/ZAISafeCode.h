//
//  ZAISafeCode.h
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, ZAISafeCodeType) {
    ZAISafeCodeType_None             = 0,
    ZAISafeCodeType_KVO              = 1 << 0,
    ZAISafeCodeType_Notification     = 1 << 1,
    ZAISafeCodeType_Target           = 1 << 2,
    ZAISafeCodeType_Timer            = 1 << 3,
    ZAISafeCodeType_Container        = 1 << 4
};

@interface ZAISafeCode : NSObject

+ (void)runSafeCodeWithType:(ZAISafeCodeType)type;

@end
