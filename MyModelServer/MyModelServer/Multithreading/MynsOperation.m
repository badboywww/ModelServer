//
//  MynsOperation.m
//  MyModelServer
//
//  Created by Bad on 2018/11/23.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "MynsOperation.h"

@implementation MynsOperation

//封装操作
- (void)main {
    
    //这里面的操作属于同一个任务操作
    for (int i = 0; i < 1000; i++) {
        NSLog(@"1--%d---%@",i,[NSThread currentThread]);
    }
    
    if (self.isCancelled) {
        return ;
    }
    
    
    for (int i = 0; i < 1000; i++) {
        NSLog(@"2--%d---%@",i,[NSThread currentThread]);
    }
    
    if (self.isCancelled) {
        return ;
    }
    
    for (int i = 0; i < 1000; i++) {
        NSLog(@"3--%d---%@",i,[NSThread currentThread]);
    }
    
    
}

@end
