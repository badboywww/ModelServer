//
//  myXMLParser.m
//  MyModelServer
//
//  Created by Bad on 2018/11/27.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "myXMLParser.h"

@interface myXMLParser()<NSXMLParserDelegate>

@end

@implementation myXMLParser


- (instancetype)initWithData:(NSData *)data {
    
  self = [super initWithData:data];
    
    self.delegate = self;
    
    [self parse];
    
    return self;
}

/*
    1.开始解析XML文档
 */
-(void)parserDidStartDocument:(NSXMLParser *)parser {
    
    NSLog(@"Start");
}

/*
 2.解析XML文档中的每一个元素
 */
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
}

/*
 3.解析结束
 */
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
}

/*
 3.整个方法结束
 */
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
     NSLog(@"End");
}




@end
