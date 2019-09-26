//
//  ZAISafeContainerCode.m
//  NNCrash
//
//  Created by LST_PRO on 2017/11/8.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "ZAISafeContainerCode.h"
#import "NSMutableSet+ZAISafe.h"
#import "NSMutableArray+ZAISafe.h"
#import "NSArray+ZAISafe.h"
#import "NSMutableDictionary+ZAISafe.h"

@implementation ZAISafeContainerCode

+ (void)runSafeCode
{
    [NSMutableSet runSafeCode];
    [NSMutableArray runSafeCode];
    [NSArray runSafeCode];
    [NSMutableDictionary runSafeCode];
}

@end
