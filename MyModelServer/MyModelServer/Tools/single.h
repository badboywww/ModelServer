
//
//  single.h
//  MyModelServer
//
//  Created by Bad on 2018/11/23.
//  Copyright © 2018 Bad. All rights reserved.
// 单例宏

#define singleH(name)  +(instancetype)share##name;

#define singleM(name)  static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone { \
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return  _instance;\
}\
+(instancetype)share##name {\
    return [[self alloc]init];\
}\
-(id)copyWithZone:(NSZone *)zone {\
    return _instance;\
}\
-(id)mutableCopyWithZone:(NSZone *)zone {\
    return _instance;\
}







