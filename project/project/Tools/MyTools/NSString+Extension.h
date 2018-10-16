//
//  NSString+Extension.h
//  project
//
//  Created by Bad on 2018/10/14.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

/**
 获取字符串的长度和宽度 text:字符串 Font:字符串字号
*/
-(CGSize)setTextSize:(NSString *) text Font:(float)font;


@end

NS_ASSUME_NONNULL_END
