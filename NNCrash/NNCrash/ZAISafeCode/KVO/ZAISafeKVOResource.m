//
//  ZAISafeKVOResource.m
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "ZAISafeKVOResource.h"

@implementation ZAISafeKVOResource

- (id)initWithResource:(id)resource observer:(id)observer key:(NSString *)key
{
    self = [super init];
    if (self) {
        self.resource = resource;
        self.key      = key;
        self.observer = observer;
    }
    return self;
}


@end
