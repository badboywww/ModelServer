//
//  GetPhotoViewController.m
//  NIM
//
//  Created by Bad on 2018/5/30.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "GetPhotoViewController.h"

@interface GetPhotoViewController ()

@end

@implementation GetPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择图片";
    self.view.backgroundColor = UIColor.whiteColor;
    [self setUI];
    
}

-(void)setUI{
    PhotoSelectorView *vc=[PhotoSelectorView new];
    vc.delegate=self;
    vc.frame=CGRectMake(0, 0, Swidth, Sheight);
    [self.view addSubview:vc];
}

-(void)postImages:(NSArray *)imageArray{
    NSLog(@"imageArray==%@",imageArray);
    
    if ([self.delegate respondsToSelector:@selector(postImages:)]) {
        [self.delegate postImages:imageArray];
    }
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
       [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
