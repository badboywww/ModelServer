//
//  twoMapViewController.m
//  MyModelServer
//
//  Created by Bad on 2018/12/1.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "twoMapViewController.h"



@interface twoMapViewController ()

@end

@implementation twoMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"第三方框架";
  
    [self setHiddenBtn:YES withbtnFrame:CGRectMake(100, 80, 100, 60) andbuttonTitle:@"定位" Action:@selector(buttonClick)];
    
    
}


/* 定位 */
- (void)buttonClick
{
    INTULocationManager *locMag = [INTULocationManager sharedInstance];
    
    [locMag requestLocationWithDesiredAccuracy:INTULocationAccuracyCity
                                       timeout:10.0
                                       delayUntilAuthorized:YES
                                         block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
                                             if (status == INTULocationStatusSuccess) {
                                                 NSLog(@"%@",currentLocation);
                                             }else{
                                    
                                                 NSLog(@"---%zd",status);
                                                 
                                             }
                                         }];
}


- (void)test {
    
    
    
    
    
}



@end
