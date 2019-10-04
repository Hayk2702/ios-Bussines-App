//
//  ViewController.h
//  PowerBank
//
//  Created by Qocharyan on 8/17/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSTimer* imageTimer;
    int numimage;
}

@property(strong, nonatomic)NSMutableArray *arrdata;

- (IBAction)btnmenu:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *sidebar;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIScrollView *topscrollview;
@property (weak, nonatomic) IBOutlet UILabel *welcomtextview;
@property (strong, nonatomic) IBOutlet UILabel *newslabel;
@property (strong, nonatomic) IBOutlet UILabel *toplabel;


@end

