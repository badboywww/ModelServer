//
//  BaseViewController.m
//  MyModelServer
//
//  Created by Bad on 2018/11/30.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (UIButton *)button {
    
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(100, 100, 81, 50);
        [_button setBackgroundColor:[UIColor blueColor]];
    }
    
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    
    [self setUI];
}

/* Nav */
- (void)setNav {

    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

/* 返回 */
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

/* 加载UI */
- (void)setUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
}

/* 是否显示button */
- (void)setHiddenBtn:(BOOL)hidden andbuttonTitle:(NSString *)title Action:(SEL)action{
    
    if (hidden) {
        [self.button setTitle:title forState:UIControlStateNormal];
        [self.view addSubview:self.button];
        [self.button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    
}

@end
