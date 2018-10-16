//
//  PhotoCollectionViewCell.m
//  NIM
//
//  Created by apple on 2017/10/13.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "UIView+NTES.h"

@implementation PhotoCollectionViewCell

- (void)setModel:(PhotoModel *)model {
    _model = model;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.contentView.frame];
    imageView.image = model.image;
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(self.contentView.width - 30, 10, 20, 20);
    if ([_model.isSelect isEqualToString:@"1"]) {
        _btn.selected = YES;
        _btn.backgroundColor = [UIColor blueColor];
    } else {
        _btn.selected = NO;
        _btn.backgroundColor = [UIColor clearColor];
    }
    _btn.layer.borderWidth = 1;
    _btn.layer.cornerRadius = _btn.width / 2;
    _btn.layer.borderColor = [UIColor blueColor].CGColor;
    [_btn addTarget:self action:@selector(check:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.contentView addSubviews:@[imageView,_btn]];
    [self.contentView addSubview:imageView];
//    [self.contentView addSubview:_btn];
}

- (void)check:(UIButton *)btn {
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        btn.backgroundColor = [UIColor blueColor];
        _model.isSelect = @"1";
    } else {
        btn.backgroundColor = [UIColor clearColor];
        _model.isSelect = @"0";
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"photo" object:nil];
}

@end
