//
//  TabBarViewController.h
//  PowerBank
//
//  Created by Qocharyan on 9/10/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TabBarViewController : UITabBarController
@property(strong,nonatomic) UISwipeGestureRecognizer *leftSwip;
@property(strong,nonatomic) UISwipeGestureRecognizer *rightSwip;
@end

NS_ASSUME_NONNULL_END
