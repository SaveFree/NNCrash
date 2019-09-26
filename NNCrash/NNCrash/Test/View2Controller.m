//
//  View2Controller.m
//  NNCrash
//
//  Created by LST_PRO on 2017/11/8.
//  Copyright © 2017年 LST_PRO. All rights reserved.
//

#import "View2Controller.h"

@interface View2Controller ()

@property (nonatomic ,strong )NSString  *kvoTest;
@property (nonatomic ,assign) NSInteger  index;
@property (nonatomic ,strong) NSTimer  *timer;


@end

@implementation View2Controller

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
//        [self addObserver:self forKeyPath:@"kvoTest" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
//        [self addObserver:self forKeyPath:@"kvoTest" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationTest:) name:@"test" object:nil];
//
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(test1) userInfo:nil repeats:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton  *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    NSArray  *array = [NSArray arrayWithObjects:@"1", nil];
//    [array objectAtIndex:1];
    
//    NSMutableArray  *mArray = [[NSMutableArray alloc] init];
//    [mArray addObject:nil];
    
    NSMutableSet *set = [[NSMutableSet alloc] init];
    [set addObject:nil];
    
    
}
- (void)buttonAction:(UIButton *)button
{
//    self.kvoTest = [NSString stringWithFormat:@"%ld",self.index++];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:nil];
}

-(void)test1
{
    NSLog(@"----");
}

- (void)notificationTest:(NSNotification *)notification
{
    NSLog(@"----");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"kvoTest"]) {
        NSLog(@"%@",change);
    }
}


- (void)dealloc
{
    //ios  11 一下  kvo  crash
//    [self removeObserver:self forKeyPath:@"kvoTest"];
//    [self removeObserver:self forKeyPath:@"kvoTest"];
//    [self removeObserver:self forKeyPath:@"kvoTest"];
    
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
