//
//  ZAISafeTarget.h
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZAISafeTarget : NSObject

+ (id)createFakeForwardTargetObject:(id)aTarget selector:(SEL)aSelector;

@end
