//
//  FeedBackViewController.m
//  FunCourse
//
//  Created by 寒竹子 on 14/12/25.
//  Copyright (c) 2014年 XuRan. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()<UITextViewDelegate,UITextFieldDelegate>

@end

@implementation FeedBackViewController

-(void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_icon_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UILabel * titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    titleView.text = @"反馈";
    titleView.textColor = [UIColor whiteColor];
    titleView.font = [UIFont systemFontOfSize:18];
    titleView.textAlignment = NSTextAlignmentCenter;
    [self addNavigationWithTitle:nil leftItem:backItem rightItem:nil titleView:titleView];
    
    UITextView  *feedBackTV = [[UITextView alloc] initWithFrame:CGRectMake((SCREEN_SIZE.width-300)/2, 15, 300, 200)];
    feedBackTV.backgroundColor = [UIColor grayColor];
    feedBackTV.alpha = 0.3;
    feedBackTV.font = [UIFont systemFontOfSize: 15.0];
    feedBackTV.delegate = self;
    [feedBackTV.layer setCornerRadius:5];
    [feedBackTV.layer setBorderWidth:0.6];
    feedBackTV.tag = 100;
    [self.view addSubview:feedBackTV];
    
    UILabel *contactphone = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_SIZE.width-300)/2, CGRectGetMaxY(feedBackTV.frame)+20, 120, 30)];
    contactphone.font = [UIFont  systemFontOfSize:15.0];
    contactphone.text = @"联系方式:";
    [contactphone.layer setCornerRadius:5];
    [contactphone.layer setBorderWidth:0.6];
    [self.view addSubview:contactphone];
    
    UITextField *phoneTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(contactphone.frame)+10, CGRectGetMaxY(feedBackTV.frame)+20, 300-120-10, 30)];
    phoneTF.delegate = self;
    phoneTF.placeholder = @"填写手机号";
    [phoneTF.layer setCornerRadius:5];
    [phoneTF.layer setBorderWidth:0.6];
    phoneTF.tag = 101;
    [self.view addSubview:phoneTF];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //点击TextV意外的区域撤销键盘
    UITextView *feedTV = (UITextView *)[self.view viewWithTag:100];
    UITextField *phoneTF = (UITextField *)[self.view viewWithTag:101];
    [feedTV resignFirstResponder];
    [phoneTF resignFirstResponder];

}

-(void)back
{
  [self.navigationController popViewControllerAnimated: YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
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
