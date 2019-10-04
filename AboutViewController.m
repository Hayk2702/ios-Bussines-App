//
//  AboutViewController.m
//  PowerBank
//
//  Created by Qocharyan on 9/13/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "AboutViewController.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)faceButton:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fb://"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"fb://profile/106572510721638"] options:@{} completionHandler:nil];
    }
    else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://m.facebook.com/qi.armenia/"] options:@{}completionHandler:nil];
    }
}

- (IBAction)instButton:(id)sender {
    NSURL *instagramURL = [NSURL URLWithString:@"instagram.com/qi_charge"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL options:@{} completionHandler:nil];
    }
    else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://instagram.com/qi_charge"] options:@{}completionHandler:nil];
    }
}

- (IBAction)callButton:(id)sender {
    
    NSString *phone_number=@"+37412606909";
    NSString *phoneStr = [NSString stringWithFormat:@"tel:%@",phone_number];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString: phoneStr] options:@{} completionHandler:nil];
    
}





@end
