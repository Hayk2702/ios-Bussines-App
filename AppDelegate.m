//
//  AppDelegate.m
//  PowerBank
//
//  Created by Qocharyan on 8/17/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0/255.0 green:165.0/255.0 blue:211.0/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:125.0/255.0 green:125.0/255.0 blue:125.0/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:10.0 forBarMetrics:UIBarMetricsDefault];

    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:20.0],NSFontAttributeName,
                          [UIColor colorWithRed:43.0/255.0 green:195.0/255.0 blue:237.0/255.0 alpha:1.0],NSForegroundColorAttributeName,
                          nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:size];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"line"]];
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:32.0/255.0 green:86.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [[UITabBar appearance] setUnselectedItemTintColor:[UIColor colorWithRed:0.0/255.0 green:165.0/255.0 blue:211.0/255.0 alpha:1.0]];
    NSDictionary *size1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:14.0],NSFontAttributeName,
                         [UIColor colorWithRed:32.0/255.0 green:86.0/255.0 blue:248.0/255.0 alpha:1.0],NSForegroundColorAttributeName,
                          nil];
    [[UITabBarItem appearance] setTitleTextAttributes:size1 forState:NO];

    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
