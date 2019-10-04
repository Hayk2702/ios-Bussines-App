//
//  MapViewController.m
//  PowerBank
//
//  Created by Qocharyan on 8/18/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "MapViewController.h"
#import "MapPin.h"
#import "SelectData.h"
@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if([SelectData sendbool]==YES){
      /*  CGFloat topPadding;
        CGFloat bottomPadding;
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            topPadding = window.safeAreaInsets.top;
            bottomPadding = window.safeAreaInsets.bottom;
            
            UINavigationBar*navbar1=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
            [self.view addSubview:navbar1];
        }else bottomPadding=0;
        UINavigationBar* navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, bottomPadding, self.view.frame.size.width, 50)];
        
        UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:[SelectData senddata][0]];
        // [navbar setBarTintColor:[UIColor lightGrayColor]];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStylePlain target:self action:@selector(Back)];
        self.navigationItem.leftBarButtonItem = backButton;
        navItem.leftBarButtonItem = backButton;
       
        [navbar setItems:@[navItem]];
        [self.view addSubview:navbar];*/
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backicon"] style:UIBarButtonItemStylePlain target:self action:@selector(Back)];
        
        self.navigationItem.leftBarButtonItem = backButton;
    }
    
    
    latitude=[self.detailModal1[0] doubleValue];
    longitude=[self.detailModal1[1] doubleValue];
   
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta=0.005;
    span.longitudeDelta=0.005;
    
    CLLocationCoordinate2D location;
    
    location.latitude=latitude;
    location.longitude=longitude;
    
    region.span=span;
    region.center=location;
    
    [self.mapView2 setRegion:region animated:YES];
    
    MapPin *ann=[[MapPin alloc] init];
    ann.coordinate=location;
    [self.mapView2 addAnnotation:ann];
}
- (IBAction)Back
{
    //[self dismissViewControllerAnimated:NO completion:nil]; // ios 6
    [self.navigationController popViewControllerAnimated:NO];
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
