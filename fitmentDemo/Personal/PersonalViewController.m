//
//  PersonalViewController.m
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/16.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController
- (id)init
{
    if (self = [super init]) {
        self.navigationController.view.backgroundColor = [UIColor brownColor];
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"bar_my"];
        self.title = @"我的";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
