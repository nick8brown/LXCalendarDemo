//
//  ViewController.m
//  LXCalendarDemo
//
//  Created by LX Zeng on 2018/12/4.
//  Copyright © 2018   https://github.com/nick8brown   All rights reserved.
//

#import "ViewController.h"

#import "GFCalendar.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *calendarView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarView_Height_Constraint;

@property (nonatomic, copy) NSString *date;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义日历";
    
    // 初始化导航栏
    [self setupNavBar];
    
    // 初始化view
    [self setupView];
}

#pragma mark - 初始化导航栏
- (void)setupNavBar {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:AppFont(18), NSForegroundColorAttributeName:SYS_White_Color}];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage getImageWithColor:AppHTMLColor(@"4bccbc")] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

#pragma mark - 初始化view
- (void)setupView {
    // 初始化calendarView
    [self setupCalendarView];
}

// 初始化calendarView
- (void)setupCalendarView {
    GFCalendarView *calendarView = [[GFCalendarView alloc] initWithFrameOrigin:CGPointMake(15, 0) width:kScreen_WIDTH-2*15];
    calendarView.didSelectDayHandler = ^(NSInteger year, NSInteger month, NSInteger day) {
        NSLog(@"=====%zd=====%zd=====%zd", year, month, day);
        
        self.date = [NSString stringWithFormat:@"%zd-%02zd-%02zd", year, month, day];
    };
    [self.calendarView addSubview:calendarView];
    
    self.calendarView_Height_Constraint.constant = CGRectGetHeight(calendarView.frame);
}

#pragma mark - 记一笔
- (IBAction)noteBtnClick:(UIButton *)sender {
    NSLog(@"当前选中的日期：%@", self.date);
}

@end
