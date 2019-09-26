//
//  ZAISafeKVOResource.h
//  NNCrash
//
//  Created by LST_PRO on 2017/10/9.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZAISafeKVOResource : NSObject

@property (nonatomic, strong) id resource;
@property (nonatomic, weak)   id observer;
@property (nonatomic, strong) NSString *key;

- (id)initWithResource:(id)resource observer:(id)observer key:(NSString *)key;

@end
