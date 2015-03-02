//
//  HomeViewController.m
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/16.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import "HomeViewController.h"
#import "AFHTTPRequestOperationManager.h"
#define fitment_zxbdtag 10
#define fitment_zxlctag 11
#define fitment_zxrjtag 12

@interface HomeViewController ()

@end

@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"bar_index"] selectedImage:[UIImage imageNamed:@"bar_index"]];
    self.tabBarItem = item;

    //设置图片url数组
    NSMutableArray *arr=[[NSMutableArray alloc]initWithObjects:@"http://ww4.sinaimg.cn/bmiddle/9dc7402fgw1emhlobi9yaj20c80850th.jpg",@"http://ww3.sinaimg.cn/bmiddle/9dc7402fgw1emhlo8nue7j20c8085dgj.jpg",@"http://ww3.sinaimg.cn/bmiddle/641af425gw1emirc6t0cxj20ia0acgpw.jpg", nil];
    //设置标题数组
    NSMutableArray *strArr = [[NSMutableArray alloc]initWithObjects:@"省空间阳台",@"清新客厅",@"地板你不得不知道的那些事", nil];
    self.navigationController.navigationBarHidden = YES;
    if([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    // 初始化自定义ScrollView类对象
    AOScrollerView *aSV = [[AOScrollerView alloc]initWithNameArr:arr titleArr:strArr height:200];
    //设置委托
    aSV.vDelegate=self;
    //添加进view
    [self.view addSubview:aSV];
    [self addListView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClick:(int)vid
{
    NSLog(@"%d",vid);
}

- (void)addListView
{
    float WIDTH = self.view.frame.size.width;
    UIView *list1View = [[UIView alloc] initWithFrame:CGRectMake(0, 210, WIDTH, 220)];
    UIButton *fitment_zxbd = [[UIButton alloc] initWithFrame:CGRectMake(10, 5, 91, 100)];
    [fitment_zxbd setBackgroundImage:[UIImage imageNamed:@"index_zxbd"] forState:UIControlStateNormal];
    [fitment_zxbd setTag:fitment_zxbdtag];
    [fitment_zxbd addTarget:self action:@selector(list1ViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [list1View addSubview:fitment_zxbd];
    
    UIButton *fitment_zxlc = [[UIButton alloc] initWithFrame:CGRectMake(115, 5, 91, 100)];
    [fitment_zxlc setBackgroundImage:[UIImage imageNamed:@"index_zxlc"] forState:UIControlStateNormal];
    [fitment_zxlc setTag:fitment_zxlctag];
    [fitment_zxlc addTarget:self action:@selector(list1ViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [list1View addSubview:fitment_zxlc];
    
    UIButton *fitment_zxrj = [[UIButton alloc] initWithFrame:CGRectMake(215, 5, 91, 100)];
    [fitment_zxrj setBackgroundImage:[UIImage imageNamed:@"index_zxrj"] forState:UIControlStateNormal];
    [fitment_zxrj setTag:fitment_zxrjtag];
    [fitment_zxrj addTarget:self action:@selector(list1ViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [list1View addSubview:fitment_zxrj];
    
    [self.view addSubview:list1View];
    
    UIView *list2View = [[UIView alloc] initWithFrame:CGRectMake(0, 330, WIDTH , 120)];
    UIButton *keyFitment = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, WIDTH/2, 60)];
    keyFitment.backgroundColor = [UIColor grayColor];
    [keyFitment setTitle:@"一键装修" forState:UIControlStateNormal];
    
    UIButton *combFitment = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/2, 60)];
    combFitment.backgroundColor = [UIColor grayColor];
    [combFitment setTitle:@"组合装修" forState:UIControlStateNormal];
    
    UIButton *progressFitment = [[UIButton alloc] initWithFrame:CGRectMake(0, 60, WIDTH, 60)];
    progressFitment.backgroundColor = [UIColor grayColor];
    [progressFitment setTitle:@"装修进度" forState:UIControlStateNormal];
    [list2View addSubview:keyFitment];
    [list2View addSubview:combFitment];
    [list2View addSubview:progressFitment];
    [self.view addSubview:list2View];
    
}

- (void)list1ViewClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case fitment_zxbdtag:
            NSLog(@"装修必读");
            break;
        case fitment_zxlctag:
            NSLog(@"装修计算器");
            break;
        case fitment_zxrjtag:
            NSLog(@"装修日记");
            break;
    }
}



@end
