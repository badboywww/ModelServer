//
//  PhotoSelectorView.m
//  NIM
//
//  Created by apple on 2017/10/13.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "PhotoSelectorView.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "PhotoCollectionViewCell.h"
#import "PhotoModel.h"
#import "UIView+NTES.h"

#define photoCell @"cell"

@implementation PhotoSelectorView {
    NSMutableArray*    _photoArray;
    
    UICollectionView*   _collection;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _photoArray = [NSMutableArray array];
        [self getImage];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postImageArray) name:@"photo" object:nil];
    }
    return self;
}

- (void)postImageArray {
    NSMutableArray *images = [NSMutableArray array];
    for (PhotoModel *model in _photoArray) {
        if ([model.isSelect isEqualToString:@"1"]) {
            [images addObject:model.image];
        }
    }
    if ([_delegate respondsToSelector:@selector(postImages:)]) {
        [_delegate postImages:images];
    }

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void) getImage{
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group == nil) {
            return ;
        }
        NSString *name = [NSString stringWithFormat:@"%@",[group valueForProperty:ALAssetsGroupPropertyName]];
        NSLog(@"name:%@",name);
        if ([name isEqualToString:@"相机胶卷"]|| [name isEqualToString:@"Camera Roll"] || [name isEqualToString:@"Camera roll"]) {
            [self getImageWith:group];
       }
    } failureBlock:^(NSError *error) {
        
        NSLog(@"Group not found!\n");
        
    }];
}

#pragma mark －获取相册图片
- (void)getImageWith:(ALAssetsGroup*)assetsGroup{
    
    NSMutableArray *imageArray = [NSMutableArray array];
    [assetsGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (result) {
            UIImage *image=[UIImage imageWithCGImage: result.aspectRatioThumbnail];
            [imageArray addObject:image];
        }
    }];
    
    //    颠倒数组  循环遍历   用临时数组替换
//    NSMutableArray *newArray = [NSMutableArray array];
    
    for (UIImage * image in [imageArray reverseObjectEnumerator]) {
        PhotoModel* model = [PhotoModel alloc];
        model.image = image;
        model.isSelect = @"0";
        [_photoArray addObject:model];
    }
    
    [self setView];
}


- (void)setView {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
//    layout.itemSize = CGSizeMake(self.width / 4, self.height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) collectionViewLayout:layout];
    _collection.delegate = self;
    _collection.dataSource = self;
    _collection.scrollsToTop = YES;
//    _collection.showsVerticalScrollIndicator = NO;
//    _collection.showsHorizontalScrollIndicator = NO;
    _collection.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    
     [_collection registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
     [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    [self addSubview:_collection];
    
    
    
    
}

#pragma mark collectionView代理方法
//设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _photoArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //取消重用
    [_collection registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    PhotoCollectionViewCell *cell = [_collection dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"%ld",(long)indexPath.row] forIndexPath:indexPath];
    PhotoModel *model = _photoArray[indexPath.row];
    cell.model = model;
    return cell;
}
//
//定义每个UICollectionView 的大小
- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath {
 //   PhotoModel * model = _photoArray[indexPath.row];
 //   return CGSizeMake(model.image.size.width / model.image.size.height * self.height, self.height);
    CGFloat collectionVc_W=Swidth;
    return CGSizeMake(collectionVc_W,collectionVc_W);
}

//定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    //  CGFloat IconCollectionView_W=IconCollectionView.wwy_height*0.3*3;
    return 3.f;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    //   CGFloat IconCollectionView_H=IconCollectionView.wwy_height*0.3*2;
    return 15.f;
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark  设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
