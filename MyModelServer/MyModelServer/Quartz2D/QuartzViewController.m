//
//  QuartzViewController.m
//  project
//
//  Created by Bad on 2018/10/9.
//  Copyright © 2018 Bad. All rights reserved.
//

#import "QuartzViewController.h"

@interface QuartzViewController ()
{
    UILabel *Textlabel;
    UITextField *PieTextFild;
   
}
@end

@implementation QuartzViewController



-(UISlider *)slider{
    if (!_slider) {
        //高度不可修改
        _slider = [[UISlider alloc] initWithFrame:CGRectMake((Swidth-350)/2, 100, 200, 40)];
        //设置最大最小值
        _slider.maximumValue = 1;
        _slider.minimumValue = 0;
        //设置当前值
        _slider.value = 0;
        //滑块右侧背景颜色
        _slider.maximumTrackTintColor = [UIColor blueColor];
        //滑块左侧背景颜色
        _slider.minimumTrackTintColor = [UIColor orangeColor];
        //滑块的颜色
        _slider.thumbTintColor = [UIColor purpleColor];
        //添加事件
        [_slider addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventValueChanged];
        
    }    return _slider;
        
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    [self setUI];
}


-(void)setNav{
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.title=@"绘制图画1";
    
    UIBarButtonItem *leftNavbar=[[UIBarButtonItem alloc]initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    
    
    self.navigationItem.leftBarButtonItem=leftNavbar;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setUI{
    
    //常规作图
    
//    _myView=[[OneView alloc]initWithFrame:CGRectMake((Swidth-350)/2, (Sheight-350-60)/2, 350, 350)];
//    _myView.backgroundColor=[UIColor grayColor];
//    
//    Textlabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_myView.frame)/2-50, CGRectGetMaxY(_myView.frame)/2, 100, 20)];
//    
//    Textlabel.textColor=[UIColor whiteColor];
//    Textlabel.text=@"0.00%";
//    
//    [_myView addSubview:Textlabel];
//    
//    [self.view addSubview:_myView];
//    [self.view addSubview:self.slider];
    
    //饼状图

    _PieVc=[[pieView alloc]initWithFrame:CGRectMake((Swidth-350)/2, (Sheight-350-60)/2, 350, 350)];
    _PieVc.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_PieVc];
    
    UILabel *PieLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_PieVc.frame), 70, 350, 20)];
    PieLabel.text=@"请输入饼状图数据,每个数据以逗号分隔:";
    
    PieTextFild=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(PieLabel.frame), CGRectGetMaxY(PieLabel.frame)+2, 300, 30)];
    PieTextFild.borderStyle = UITextBorderStyleRoundedRect;
    PieTextFild.clearButtonMode = UITextFieldViewModeWhileEditing;
    PieTextFild.autocorrectionType = UITextAutocorrectionTypeYes;
    PieTextFild.adjustsFontSizeToFitWidth = YES;
    PieTextFild.delegate = self;
    [PieTextFild addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:PieTextFild];
    [self.view addSubview:PieLabel];
    
    
    
    UIButton *oneBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    oneBtn.frame=CGRectMake(CGRectGetMinX(_PieVc.frame), CGRectGetMaxY(_PieVc.frame)+10, _PieVc.width, 30);
    [oneBtn setTitle:@"绘图2" forState:UIControlStateNormal];
    oneBtn.backgroundColor=[UIColor orangeColor];
//    [oneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [oneBtn addTarget:self action:@selector(NextAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:oneBtn];
    
}

-(void)NextAction{
    UIKitDrawingViewController *vc=[UIKitDrawingViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)valueChange {
    NSLog(@"%.2f",self.slider.value);
    Textlabel.text=[NSString stringWithFormat:@"%.2f%%",self.slider.value * 100];
    _myView.progress = self.slider.value;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (![PieTextFild isExclusiveTouch]) {
        
        [PieTextFild resignFirstResponder];
        
    }
}
-(void)textFieldValueChanged:(UITextField *)textFild{
    
    NSLog(@"text==%@",textFild.text);
    
    NSArray * array = [textFild.text componentsSeparatedByString:@","];
    
    
    _PieVc.PieArray=array;
    
    NSLog(@"array = %@",array);
    
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
