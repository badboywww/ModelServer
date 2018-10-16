//
//  Person.h
//  project
//
//  Created by Bad on 2018/9/4.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property(nonatomic , assign) int age;
@property(nonatomic , strong) NSString *name;

@end
