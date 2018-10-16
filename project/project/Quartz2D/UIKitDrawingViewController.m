//
//  UIKitDrawingViewController.m
//  project
//
//  Created by Bad on 2018/10/13.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "UIKitDrawingViewController.h"

@interface UIKitDrawingViewController ()

@property (nonatomic , weak) UIImageView *imgView;

@property (nonatomic , weak) MyImgeView *myImgVc;

@end

@implementation UIKitDrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    [self setUI];
}


-(void)setNav{
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.title=@"绘制图画2";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setUI{
    
#pragma mark 雪花
//    _twoVc=[[TwoView alloc]initWithFrame:self.view.bounds];
//    _twoVc.backgroundColor=[UIColor blackColor];
//    [self.view addSubview:_twoVc];
    
#pragma mark 图形 上下文栈 上下文矩阵
//    _drawVc=[[DrawView alloc]initWithFrame:CGRectMake((Swidth-300)/2, (Sheight-300-60)/2, 300, 300)];
//    _drawVc.backgroundColor=[UIColor lightGrayColor];
//    [self.view addSubview:_drawVc];
    
    [self ImgAddWatermark];
    
}


//图片加水印
-(void)ImgAddWatermark{
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //生成图片
    UIImage *img=[UIImage imageNamed:@"smm"];
    UIImage *newImage=[[UIImage alloc]init];
   // CGSizeMake(CGFloat width, CGFloat height)
    newImage = [newImage setImageAddWatermark:img ImageSize:img.size Opaque:NO Scale:0.0 Watermarkstr:@"@隔壁老王" WatermarkstrColor:[UIColor whiteColor] StrFont:12];
    
    //显示图片
    UIImageView *myimageVc=[[UIImageView alloc]initWithFrame:CGRectMake((Swidth-380)/2, (Sheight-566)/2, newImage.size.width, newImage.size.height)];
    myimageVc.image=newImage;
    
    [self.view addSubview:myimageVc];
}





//自己的ImageView
-(void)MyImgVc{
    MyImgeView *myImgVc=[[MyImgeView alloc]initWithImage:[UIImage imageNamed:@"QQ"]];
    
    self.myImgVc=myImgVc;
    [self.view addSubview:myImgVc];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.myImgVc.image=[UIImage imageNamed:@"001"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
