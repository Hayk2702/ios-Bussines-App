//
//  HomeViewController.m
//  PowerBank
//
//  Created by Qocharyan on 9/10/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "HomeViewController.h"
#import "TabBarViewController.h"
#import "AppDelegate.h"
#import "LanguageManager.h"
#import "SelectData.h"
#import "ViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [SelectData setboolt1:YES];
      
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)langArm:(id)sender {
    [LanguageManager saveLanguageByIndex:1];
    
    [self reloadRootViewController];
}


- (IBAction)langEng:(id)sender {
    [LanguageManager saveLanguageByIndex:0];
    
    [self reloadRootViewController];
}
- (void)reloadRootViewController
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSString *storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    delegate.window.rootViewController = [storyboard instantiateInitialViewController];
}

@end
