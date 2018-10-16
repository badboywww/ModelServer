//
//  Person.m
//  project
//
//  Created by Bad on 2018/9/4.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "Person.h"

@implementation Person

// 作用：告诉系统哪些属性需要归档
// 调用：把一个自定义对象归档时调用

-(void)encodeWithCoder:(NSCoder *)aCoder{
    //aCoder 用来归档的
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
}

// 作用：告诉系统哪些属性需要解档
// 调用：解档一个文件时调用
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    
    if([super init]){
        //name age
        
     _name = [aDecoder decodeObjectForKey:@"name"];
     _age  = [aDecoder decodeIntForKey:@"age"];
        
    }
    return self;
}

@end
