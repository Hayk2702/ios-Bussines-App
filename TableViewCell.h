//
//  TableViewCell.h
//  PowerBank
//
//  Created by Qocharyan on 8/18/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

- (IBAction)mapButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellDescription;
- (IBAction)callButton:(id)sender;

@end

NS_ASSUME_NONNULL_END
