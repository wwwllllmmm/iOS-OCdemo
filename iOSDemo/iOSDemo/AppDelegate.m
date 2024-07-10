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




@end
