//
//  TableViewController.h
//  PowerBank
//
//  Created by Qocharyan on 8/18/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController{
    NSMutableArray *title;
    NSMutableArray *description;
    NSMutableArray *image;
    NSMutableArray *Phone;
    NSMutableArray *lat;
    NSMutableArray *lng;
    NSMutableArray *Text;
   
    
}

@end

NS_ASSUME_NONNULL_END
