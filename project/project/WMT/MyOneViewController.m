//
//  MyOneViewController.m
//  project
//
//  Created by Bad on 2018/10/15.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "MyOneViewController.h"
#import <LBPhotoBrowserManager.h>
#import <LBPhotoBrowserView.h>
#import <LBPhotoBrowserConst.h>
#import <SDWebImage/UIImageView+WebCache.h>

#define Swidth [UIScreen mainScreen].bounds.size.width
#define Sheight [UIScreen mainScreen].bounds.size.height
#define photoCells @"cell"
static NSString *headerViewIdentifier = @"hederview";
static inline CGSize lb_screenSize(){
    return [UIScreen mainScreen].bounds.size;
}

@interface LBWebCollectionViewCell :UICollectionViewCell
@property (nonatomic , weak)UIImageView *imageView;

@end

@implementation LBWebCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        self.contentView.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:imageView];
        self.backgroundColor = [UIColor whiteColor];
        _imageView = imageView;
    }
    return self;
}
@end

@interface MyOneViewController ()
@property (nonatomic , weak)UICollectionView *collectionView;
@property (nonatomic , strong)NSArray <NSString *> *lagerURLStrings;

@end

@implementation MyOneViewController

static NSString * const reuseIdentifier = @"webCell";

- (UICollectionView *)collectionView {
    if (!_collectionView) {
         _collectionView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 40);
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, Swidth, Sheight-64) collectionViewLayout:flowLayout];
        [self.view addSubview:collectionView];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView = collectionView;
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    if ([UIDevice currentDevice].systemVersion.floatValue > 11.0) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.lagerURLStrings = @[//大图
                             @"http://p7.pstatp.com/large/w960/5321000135125ebb938a",
                             @"http://ww1.sinaimg.cn/large/61b69811gw1f6bqb1bfd2j20b4095dfy.jpg",
                             @"http://ww1.sinaimg.cn/large/54477ddfgw1f6bqkbanqoj20ku0rsn4d.jpg",
                             @"http://ww4.sinaimg.cn/large/006ka0Iygw1f6b8gpwr2tj30bc0bqmyz.jpg",
                             @"http://ww2.sinaimg.cn/large/9c2b5f31jw1f6bqtinmpyj20dw0ae76e.jpg",
                             @"http://ww1.sinaimg.cn/large/536e7093jw1f6bqdj3lpjj20va134ana.jpg",
                             ];
    [self.collectionView registerClass:[LBWebCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.lagerURLStrings.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LBWebCollectionViewCell *cell = (LBWebCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.lagerURLStrings[indexPath.row]]];
    return cell;
}




- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath {
    
    CGFloat collectionVc_W=(Swidth-60)/3;
    return CGSizeMake(collectionVc_W,collectionVc_W);
}

//定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 15, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 1.f;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 5.f;
}



#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *items = @[].mutableCopy;
    UICollectionView *cell = [collectionView cellForItemAtIndexPath:indexPath];// 这里不会为空
    for (int i = 0; i < self.lagerURLStrings.count; i++ ) {
        LBWebCollectionViewCell *cell = ( LBWebCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
   
        LBPhotoWebItem *item = [[LBPhotoWebItem alloc]initWithURLString:self.lagerURLStrings[i] frame:cell.frame];
        item.placeholdImage = [UIImage imageNamed:@"placehold.jpeg"];
        [items addObject:item];
    }
    // 这里只要你开心 可以无限addBlock
    
    [[[[[LBPhotoBrowserManager defaultManager]showImageWithWebItems:items selectedIndex:indexPath.row fromImageViewSuperView:collectionView] addCollectionViewLinkageStyle:UICollectionViewScrollPositionCenteredHorizontally cellReuseIdentifier:reuseIdentifier]addLongPressShowTitles:@[@"保存图片",@"删除",@"识别二维码",@"取消"]]addTitleClickCallbackBlock:^(UIImage *image, NSIndexPath *indexPath, NSString *title) {
        LBPhotoBrowserLog(@"%@",title);
    }].lowGifMemory = YES;
    
    [LBPhotoBrowserManager defaultManager].needPreloading = NO;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIdentifier forIndexPath:indexPath];
        //添加头视图的内容
        [self addContent];
        //头视图添加view
        [header addSubview:_headerView];
        return header;
    }
    //如果底部视图
    //    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
    //
    //    }
    return nil;
}

/*
 *  设置头部内容
 */
-(void)addContent
{
    UIView *header=[[UIView alloc]init];
    header.frame=CGRectMake(0, 0, self.view.frame.size.width, 40);
    header.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    NSString *str=[self NewTimeStr];
    
    CGSize str_Size=[str setTextSize:str Font:15];
    
    UILabel *Timelanbel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, str_Size.width, 40)];
    Timelanbel.text=str;
    Timelanbel.font = [UIFont systemFontOfSize:15];
    Timelanbel.textColor=[UIColor blackColor];
    
    [header addSubview:Timelanbel];
    
    self.headerView=header;
}


-(NSString *)NewTimeStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    return currentTimeString;
}


@end
