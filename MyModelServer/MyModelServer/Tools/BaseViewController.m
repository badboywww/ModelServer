//
//  BaseViewController.m
//  MyModelServer
//
//  Created by Bad on 2018/11/30.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "BaseViewController.h"

#define tableVcCell @"cell"

@interface BaseViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseViewController

#pragma mark - 懒加载
/** tableview */
- (UITableView *)tableview {
    if( !_tableview) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.backgroundColor=[UIColor whiteColor];
        _tableview = tableView;
    }
    
    return _tableview;
}
/** button */
- (UIButton *)button {
    
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0, 100, 50);
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

/* 是否显示button YES:隐藏 NO:显示  */
- (void)setHiddenBtn:(BOOL)hidden withbtnFrame:(CGRect)frame andbuttonTitle:(NSString *)title Action:(SEL)action{
    
    if (!hidden) {
        self.button.frame = frame;
        [self.button setTitle:title forState:UIControlStateNormal];
        [self.button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.button];
        
    }
    
    
}
/* 是否显示tableview YES:隐藏 NO:显示 */
- (void)setHiddenTableView:(BOOL)hidden withTableViewFrame:(CGRect)frame {
    
    if (!hidden) {
        [self.view addSubview:self.tableview];
    }
    
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableVcCell forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableVcCell];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
   
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}




@end
