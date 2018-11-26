//
//  multilImagemodel.h
//  MyModelServer
//
//  Created by Bad on 2018/11/25.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface multilImagemodel : NSObject

@property (nonatomic , strong) NSString *name;

@property (nonatomic , strong) NSString *icon;

@property (nonatomic , strong) NSString *download;


+ (instancetype)appWithDict:(NSDictionary *)dic;


@end

NS_ASSUME_NONNULL_END
