//
//  AppDelegate.m
//  iOSDemo
//
//  Created by aaa on 2020/4/13.
//  Copyright © 2020 aaa. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navigationVC;
    [self.window makeKeyAndVisible];
    return YES;
}

//- (void)styleOne{
//    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = [[ViewController alloc] init];
//    [self.window makeKeyAndVisible];
//}
//
//
//- (void)styleTwo{
//    
//    // 创建第二个window，遮挡住第一个window
//    // 引导页的操作到StyleViewController控制器里面做
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = [[StyleViewController alloc] init];
//    [self.window makeKeyAndVisible];
//    [self performSelector:@selector(cancelStyleWindow) withObject:nil afterDelay:5];
//}
//
//
///**
// 销毁引导页Window
// */
//- (void)cancelStyleWindow{
//    
//    [self.styleWindow resignKeyWindow];
//    self.styleWindow = nil;
//}



@end
