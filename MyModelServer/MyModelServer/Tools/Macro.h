//
//  Macro.h
//  iOSZhongYe
//
//  Created by 郑敏捷 on 17/3/21.
//  Copyright © 2017年 郑敏捷. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#ifdef DEBUG // 处于开发阶段
#define ZmjLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define ZmjLog(...)
#endif

// 屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

// 屏幕高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define iPhone4Height 480
#define iPhone5Height 568
#define iPhone6Height 667
#define iPhone6PHeight 736

// RGB颜色值
#define ZmjColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]

// 整体背景颜色
#define AllBackColor ZmjColor(242, 242, 242)
// 整体文字颜色
#define AllTextColor ZmjColor(121, 121, 121)

#define isIpad [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad

#define FILEMANAGER       [NSFileManager defaultManager]

#define CACHES_DIRECTORY  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// 屏幕宽
#define ScreenWidthRatio (isIpad?(ScreenWidth / 768.0):(ScreenWidth / 320.0))

// 距离比例
#define ZmjSize(R) ScreenWidthRatio * R

// 字体大小比例
#define ZmjFontSize(R) [UIFont systemFontOfSize: ScreenWidthRatio * R]

#define MenuHeight  35 * ScreenWidthRatio

#define BtnHeight   40 * ScreenWidthRatio

#define CellHeight  44 * ScreenWidthRatio

#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;

#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

#endif /* Macro_h */
