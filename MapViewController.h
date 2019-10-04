//
//  MapViewController.h
//  PowerBank
//
//  Created by Qocharyan on 8/18/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//
#import <Mapkit/MapKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : ViewController{
    double latitude;
    double longitude;
    
}
@property(strong,nonatomic) NSArray *detailModal1;

@property (weak, nonatomic) IBOutlet MKMapView *mapView2;

@end

NS_ASSUME_NONNULL_END
