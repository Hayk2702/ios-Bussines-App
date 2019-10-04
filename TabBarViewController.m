//
//  TabBarViewController.m
//  PowerBank
//
//  Created by Qocharyan on 9/10/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.leftSwip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    
    self.leftSwip.direction=UISwipeGestureRecognizerDirectionLeft;
    self.rightSwip.direction=UISwipeGestureRecognizerDirectionRight;
    
    
    [self.view addGestureRecognizer:self.leftSwip];
    [self.view addGestureRecognizer:self.rightSwip];
    
}

-(void)handleSwipes:(UISwipeGestureRecognizer *) sender{
    
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft){
        self.tabBarController.selectedIndex = 0;
        self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:0];
        NSLog(@"LEFT");
        
    }
    else if(sender.direction == UISwipeGestureRecognizerDirectionRight){
        [(TabBarViewController *)self.tabBarController setSelectedIndex:2];

        NSLog(@"Right");
        
    }
    
    
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
