//
//  TableViewCell.m
//  PowerBank
//
//  Created by Qocharyan on 8/18/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "TableViewCell.h"
#import "help.h"
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)mapButton:(id)sender {    

}
- (IBAction)callButton:(id)sender {
    
    NSMutableDictionary *testDic=[[NSMutableDictionary alloc]init];
    testDic=[help curentDIct];

    NSString *phone_number=[NSString stringWithFormat:@"%@",[testDic objectForKey:self.cellTitle.text]];
    
    
    NSString *phoneStr = [NSString stringWithFormat:@"tel:%@",phone_number];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString: phoneStr] options:@{} completionHandler:nil];

}
@end
