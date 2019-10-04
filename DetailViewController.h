//
//  DetailViewController.h
//  PowerBank
//
//  Created by Qocharyan on 8/18/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//
#import <Mapkit/MapKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : ViewController{
    double latitude;
    double longitude;
    NSString *x;
}
@property(strong,nonatomic) NSArray *detailModal;

@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UILabel *detailDescription;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextView *Text;

-(IBAction)map:(id)sender;
- (IBAction)callButton2:(id)sender;


@end

NS_ASSUME_NONNULL_END
