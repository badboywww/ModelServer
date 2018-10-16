//
//  NSString+Extension.m
//  project
//
//  Created by Bad on 2018/10/14.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


-(CGSize)setTextSize:(NSString *)text Font:(float)font{
    
    //计算文本文字size
    
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]}];
    
    //获取宽高
    
    CGSize statuseStrSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    
    return statuseStrSize;
}



@end
