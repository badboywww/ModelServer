//
//  toolsModel.h
//  MyModelServer
//
//  Created by Bad on 2018/11/23.
//  Copyright © 2018 Bad. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
 
@interface toolsModel : NSObject<NSCopying,NSMutableCopying>


//提供类方法
//1.向外界表明,表明身份，说明这是个单例，方便外界访问
//2.注意点：类方法命名方法 一般是 share+类名|default+类名

singleH(toolsModel)

@end

NS_ASSUME_NONNULL_END
