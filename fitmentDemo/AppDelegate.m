//
//  AppDelegate.m
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/16.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "CompanyViewController.h"
#import "DesignViewController.h"
#import "LogisticsViewController.h"
#import "PersonalViewController.h"

@interface AppDelegate ()
{
    HomeViewController *homeController;
    DesignViewController *designController;
    CompanyViewController *companyController;
    LogisticsViewController *logisticsController;
    PersonalViewController *personalController;
    
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //检查网络是否存在 如果不存在 则弹出提示 暂时未做
    
    //首页
    homeController = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeController];
    //设计 设计师和设计图
    designController = [[DesignViewController alloc] init];
    UINavigationController *designNav = [[UINavigationController alloc] initWithRootViewController:designController];
    //公司
    companyController = [[CompanyViewController alloc] init];
    UINavigationController *companyNav = [[UINavigationController alloc] initWithRootViewController:companyController];
    //物流
    logisticsController = [[LogisticsViewController alloc] init];
    UINavigationController *logisticsNav = [[UINavigationController alloc] initWithRootViewController:logisticsController];
    //个人中心
    personalController = [[PersonalViewController alloc] init];
    UINavigationController *persoNav = [[UINavigationController alloc] initWithRootViewController:personalController];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:homeNav, designNav, companyNav, logisticsNav, persoNav,nil];
    
    //初始化工作
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
