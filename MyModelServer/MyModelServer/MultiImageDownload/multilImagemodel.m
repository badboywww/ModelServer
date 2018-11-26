//
//  multilImagemodel.m
//  MyModelServer
//
//  Created by Bad on 2018/11/25.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "multilImagemodel.h"

@implementation multilImagemodel


+ (instancetype)appWithDict:(NSDictionary *)dic {
    
    multilImagemodel *app = [[multilImagemodel alloc]init];
    
    [app setValuesForKeysWithDictionary:dic];
    
    return app;
}

@end
