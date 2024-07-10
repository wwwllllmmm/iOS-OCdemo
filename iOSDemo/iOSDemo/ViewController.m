//
//  ViewController.m
//  iOSDemo
//
//  Created by aaa on 2020/4/13.
//  Copyright © 2020 aaa. All rights reserved.
//

#import "ViewController.h"
#import "TabBarViewController/FirstView/FirstViewController.h"
#import "TabBarViewController/New Group/SecondViewController.h"
#import "TabBarViewController/New Group/ThirdViewController.h"
#import "TabBarViewController/New Group/FourthViewController.h"
#import "TabBarViewController/New Group/FifthViewController.h"
@implementation ViewController

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeAll;

    self.tabBarController = [[UITabBarController alloc] init];
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    FourthViewController *fourthVC = [[FourthViewController alloc] init];
    FifthViewController *fifthVC = [[FifthViewController alloc] init];
    self.tabBarController.viewControllers = @[firstVC, secondVC, thirdVC, fourthVC, fifthVC];
    self.tabBarController.tabBar.translucent = NO;
    self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
    
    UITabBarItem *tabItem1 = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"Home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //设置Tab

    firstVC.tabBarItem = tabItem1;
    firstVC.view.backgroundColor = [UIColor whiteColor];
    secondVC.title = @"好友";
    secondVC.view.backgroundColor = [UIColor whiteColor];
    thirdVC.title = @"+";
    thirdVC.view.backgroundColor = [UIColor whiteColor];
    fourthVC.title = @"收件箱";
    fourthVC.view.backgroundColor = [UIColor whiteColor];
    fifthVC.title = @"主页";
    fifthVC.view.backgroundColor = [UIColor whiteColor];

    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
    [self.tabBarController didMoveToParentViewController:self];
}




@end
