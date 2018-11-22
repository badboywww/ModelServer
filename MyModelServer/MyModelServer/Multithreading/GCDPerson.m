//
//  GCDPerson.m
//  MyModelServer
//
//  Created by Bad on 2018/11/22.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "GCDPerson.h"

@implementation GCDPerson

-(NSArray *)books {
    
    if (_books == nil) {
        _books = @[@"一分钟ios开发",@"如来神掌"];
    }
    
    return _books;
}

@end
