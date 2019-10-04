//
//  MapPin.h
//  PowerBank
//
//  Created by Qocharyan on 8/18/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MapPin : NSObject <MKAnnotation>{
    CLLocationCoordinate2D coordinate;
}
@property(nonatomic,assign) CLLocationCoordinate2D coordinate;
@end

NS_ASSUME_NONNULL_END
