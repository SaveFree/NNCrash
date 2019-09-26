//
//  ViewController.m
//  NNCrash
//
//  Created by LST_PRO on 2017/9/4.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "ViewController.h"
#import "View2Controller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton  *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonAction:(UIButton *)button
{
    View2Controller  *viewController = [[View2Controller alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
