//
//  DetailViewController.m
//  PowerBank
//
//  Created by Qocharyan on 8/18/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "DetailViewController.h"
#import "MapViewController.h"
#import "MapPin.h"
#import "help.h"
#import "SelectData.h"
@interface DetailViewController (){
    BOOL tt;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if([SelectData sendbool]==NO){
   self.navigationItem.title=self.detailModal[0];
    self.detailTitle.text=self.detailModal[0];
    self.detailDescription.text=self.detailModal[1];
    self.Text.text=self.detailModal[5];
    latitude=[self.detailModal[3] doubleValue];
    longitude=[self.detailModal[4] doubleValue];
    int row=[self.detailModal[6] intValue];
        self.detailImageView.image=[SelectData images2][row-1];
    
   /* NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    dict= [help imageDict];
    NSString *imageName=[dict objectForKey:self.detailModal[0]];
    NSString *strint=[imageName substringWithRange:NSMakeRange(3, 1)];
    NSInteger cnt=[strint integerValue]-1;

    NSMutableArray *marray=[[NSMutableArray alloc]init];
    marray=[SelectData images];
    self.detailImageView.image=marray[cnt];*/
        
        /*
        NSString *urlstring=[NSString stringWithFormat:@"https://mysmartech.ru/Qi/im%i.png",row];
              NSURL  *url = [NSURL URLWithString:urlstring];
              NSData *urlData = [NSData dataWithContentsOfURL:url];
              
              
              if ( urlData )
              {
                  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                  NSString *documentsDirectory = [paths objectAtIndex:0];
                  NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,[NSString stringWithFormat:@"im%i.png",row]];
                  [urlData writeToFile:filePath atomically:YES];
                  UIImage *image1=[UIImage imageWithContentsOfFile:filePath];
                  //   self.imageView.image=image1;
                  self.detailImageView.image=image1;

              }
        */
        
        tt=false;
    }
    else {
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
  /*
        self.navigationItem.title=[SelectData senddata][0];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backicon"] style:UIBarButtonItemStylePlain target:self action:@selector(Back)];
        
        self.navigationItem.leftBarButtonItem = backButton;

        */
        
        self.detailTitle.text=[SelectData senddata][0];
        self.detailDescription.text=[SelectData senddata][1];
        self.Text.text=[SelectData senddata][5];
        latitude=[[SelectData senddata][3] doubleValue];
        longitude=[[SelectData senddata][4] doubleValue];
        
        int row=[[SelectData senddata][6] intValue];
        self.detailImageView.image=[SelectData images2][row-1];

        /*
        NSMutableArray *marray=[[NSMutableArray alloc]init];
        marray=[SelectData images];
        self.detailImageView.image=marray[[SelectData cim]];*/
      /*  NSString *urlstring=[NSString stringWithFormat:@"https://mysmartech.ru/Qi/im%i.png",row];
        NSURL  *url = [NSURL URLWithString:urlstring];
        NSData *urlData = [NSData dataWithContentsOfURL:url];
        
        
        if ( urlData )
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,[NSString stringWithFormat:@"im%i.png",row]];
            [urlData writeToFile:filePath atomically:YES];
            UIImage *image1=[UIImage imageWithContentsOfFile:filePath];
            //   self.imageView.image=image1;
            self.detailImageView.image=image1;

        }*/
        tt=true;
    }
    
   
    self.mapView.layer.cornerRadius=5;
    
    
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta=0.005;
    span.longitudeDelta=0.005;
    
    CLLocationCoordinate2D location;
    
    location.latitude=latitude;
    location.longitude=longitude;
    
    region.span=span;
    region.center=location;
    
    [self.mapView setRegion:region animated:YES];
    
    MapPin *ann=[[MapPin alloc] init];
    ann.coordinate=location;
    [self.mapView addAnnotation:ann];
    
    
}
- (IBAction)Back
{
    [SelectData setsendbool:NO];
    [self dismissViewControllerAnimated:NO completion:nil]; // ios 6
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"shd"]){
        if(tt==true){
            MapViewController *detailView=[segue destinationViewController];
              
            detailView.detailModal1=@[[SelectData senddata][3],[SelectData senddata][4]];
            
        }else{
        MapViewController *detailView=[segue destinationViewController];
        
        detailView.detailModal1=@[self.detailModal[3],self.detailModal[4]];
        }
    }
    
}

- (IBAction)map:(id)sender {
    
     /*NSString *url=[NSString stringWithFormat:@"http://maps.apple.com/,aps?daddr=%f,$f",latitude,longitude];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
      */
    
     
}

- (IBAction)callButton2:(id)sender {
    NSString *phone_number;
    if([SelectData sendbool]==YES){
        phone_number=[SelectData senddata][2];
    }else phone_number=self.detailModal[2];
    
    NSLog(@"Phone=%@",phone_number);
    
    NSString *phoneStr = [NSString stringWithFormat:@"tel:%@",phone_number];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString: phoneStr] options:@{} completionHandler:nil];
}
@end
