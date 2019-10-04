//
//  ViewController.m
//  PowerBank
//
//  Created by Qocharyan on 8/17/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"
#import "SelectData.h"
#import "AppDelegate.h"
#import "LanguageManager.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    BOOL isSideViewOpen;
}
@synthesize arrdata,sidebar;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.newslabel.layer.masksToBounds=YES;
    self.toplabel.layer.masksToBounds=YES;

    self.newslabel.layer.cornerRadius=7;
    self.toplabel.layer.cornerRadius=7;

    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    float batLeft = (float)[[UIDevice currentDevice] batteryLevel]*100;
    
    sidebar.backgroundColor=[UIColor groupTableViewBackgroundColor];
    sidebar.hidden=YES;
    isSideViewOpen=false;
    arrdata=[[NSMutableArray alloc] initWithObjects:@"Hayeren",@"English", nil];
 
 
    
    
    
    
   
    if([self connected]==YES){
        
        NSString *langstr=[LanguageManager currentLanguageString];
        
        if(batLeft>0 && batLeft<20){
            if([langstr isEqualToString:@"English"]){
                self.welcomtextview.text=@"In the field Qi find nearest restaurant/bar and enjoy";
            }else {
                self.welcomtextview.text=@"«Քյուայ» բաժնում գտեք Ձեզ հարմար սրճարան/ռեստորանը և վայելեք";
                
            }
            
        }else if(batLeft>=20 && batLeft<50){
            if([langstr isEqualToString:@"English"]){
                self.welcomtextview.text=@"You have a hour to charge your phone";
            }else {
                self.welcomtextview.text=@"Դուք ունեք մեկ ժամ՝ հեռախոսը լիցքավորելու համար";
                
            }
            
        }else if(batLeft>=50 && batLeft<80){
            if([langstr isEqualToString:@"English"]){
                self.welcomtextview.text=@"Think about charging phone, combining with hot tea";
            }else {
                self.welcomtextview.text=@"Մտածեք հեռախոսը լիցքավորելու մասին, համատեղելով տաք թեյի հետ";
                
            }
            
        }else if(batLeft>=80){
            if([langstr isEqualToString:@"English"]){
                self.welcomtextview.text=@"Հեռախոսը չունի լիցքավորման կարիք, բայց մեկ բաժակ սուրճը չի խանգարի ։)";
            }else {
                self.welcomtextview.text=@"You don't need to charge phone, but a cup of coffee whill not hurt :)";
                
            }
            
        }
        
        
        
        if([SelectData boolt]==YES)
        {
        
        [SelectData setboolt:NO];
        
        [NSURLConnection cancelPreviousPerformRequestsWithTarget:self];
        NSError *error;
        NSString *url_string = [NSString stringWithFormat: @"https://mysmartech.ru/Qi/title.php"];
        NSURL *ur1=[NSURL URLWithString:url_string];
        NSData *data = [NSData dataWithContentsOfURL:ur1 options:kNilOptions error:&error];
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        
        NSUInteger cnt=[json count];
        
        NSMutableArray *mtitle=[[NSMutableArray alloc] init];
        
        for (int i=0; i<cnt; i++) {
            NSString *x=[NSString stringWithFormat:@"%@",json[i]];

            
            NSString *y=[x substringWithRange:NSMakeRange(7, [x length]-10)];
            [mtitle addObject:y];
        }
        
        [SelectData settitle:mtitle];
        
        url_string = [NSString stringWithFormat: @"https://mysmartech.ru/Qi/description.php"];
        data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        cnt=[json count];
        NSMutableArray *mdescription=[[NSMutableArray alloc] init];
        
        for (int i=0; i<cnt; i++) {
            NSString *x=[NSString stringWithFormat:@"%@",json[i]];
            NSString *y=[x substringWithRange:NSMakeRange(7, [x length]-10)];
            [mdescription addObject:y];
        }
        [SelectData setdesc:mdescription];
        
        
        url_string = [NSString stringWithFormat: @"https://mysmartech.ru/Qi/phone.php"];
        data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        cnt=[json count];
        NSMutableArray *mphone=[[NSMutableArray alloc] init];
        
        for (int i=0; i<cnt; i++) {
            NSString *x=[NSString stringWithFormat:@"%@",json[i]];
            NSString *y=[x substringWithRange:NSMakeRange(7, [x length]-10)];
            [mphone addObject:y];
        }
         [SelectData setphone:mphone];
        
        
        url_string = [NSString stringWithFormat: @"https://mysmartech.ru/Qi/text.php"];
        data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        cnt=[json count];
        NSMutableArray *mtext=[[NSMutableArray alloc] init];
        
        for (int i=0; i<cnt; i++) {
            NSString *x=[NSString stringWithFormat:@"%@",json[i]];
            NSString *y=[x substringWithRange:NSMakeRange(7, [x length]-10)];
            [mtext addObject:y];
        }
        [SelectData settext:mtext];
        
        
        
        url_string = [NSString stringWithFormat: @"https://mysmartech.ru/Qi/x.php"];
        data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        cnt=[json count];
        NSMutableArray *mx=[[NSMutableArray alloc] init];
        
        for (int i=0; i<cnt; i++) {
            NSString *x=[NSString stringWithFormat:@"%@",json[i]];
            NSString *y=[x substringWithRange:NSMakeRange(7, [x length]-10)];
            [mx addObject:y];
        }
        [SelectData setlat:mx];
        
        
        url_string = [NSString stringWithFormat: @"https://mysmartech.ru/Qi/y.php"];
        data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        cnt=[json count];
        NSMutableArray *my=[[NSMutableArray alloc] init];
        
        for (int i=0; i<cnt; i++) {
            NSString *x=[NSString stringWithFormat:@"%@",json[i]];
            NSString *y=[x substringWithRange:NSMakeRange(7, [x length]-10)];
            [my addObject:y];
        }
        [SelectData setlng:my];
        
       
        
        NSMutableArray *mimages=[[NSMutableArray alloc] init];
        for(NSUInteger j=1;j<=cnt;j++){
            NSString *urlstring=[NSString stringWithFormat:@"https://mysmartech.ru/Qi/img%li.png",j];
        NSURL  *url = [NSURL URLWithString:urlstring];
        NSData *urlData = [NSData dataWithContentsOfURL:url];
        
        
        if ( urlData )
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,[NSString stringWithFormat:@"img%li.png",j]];
            [urlData writeToFile:filePath atomically:YES];
            UIImage *image1=[UIImage imageWithContentsOfFile:filePath];
            //   self.imageView.image=image1;
            
            [mimages addObject:image1];
            
        }
        }
        
        [SelectData setimages:mimages];
        
        
        NSMutableArray *mimages2=[[NSMutableArray alloc] init];
               for(NSUInteger j=1;j<=cnt;j++){
                   NSString *urlstring=[NSString stringWithFormat:@"https://mysmartech.ru/Qi/im%li.png",j];
               NSURL  *url = [NSURL URLWithString:urlstring];
               NSData *urlData = [NSData dataWithContentsOfURL:url];
               
               
               if ( urlData )
               {
                   NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                   NSString *documentsDirectory = [paths objectAtIndex:0];
                   NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,[NSString stringWithFormat:@"im%li.png",j]];
                   [urlData writeToFile:filePath atomically:YES];
                   UIImage *image1=[UIImage imageWithContentsOfFile:filePath];
                   //   self.imageView.image=image1;
                   
                   [mimages2 addObject:image1];
                   
               }
               }
               
               [SelectData setimages2:mimages2];
        
    
        
        }
    }
    
    if([self connected]==YES && [SelectData boolt1]==YES){
        [SelectData setboolt1:NO];
        NSError *error;
        NSString* url_string = [NSString stringWithFormat: @"https://mysmartech.ru/Qi/frontpageios.php"];
       NSData* data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
      NSArray*  json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSUInteger cnt=[json count];
        NSMutableArray *fp=[[NSMutableArray alloc] init];
        
        for (int i=0; i<cnt; i++) {
            
            NSString *x=[NSString stringWithFormat:@"%@",json[i]];
            NSString *y=[x substringWithRange:NSMakeRange(6, [x length]-8)];
            
            [fp addObject:y];
        }
        
        
        NSMutableArray *imageArray=[[NSMutableArray alloc] init];
        imageArray=[SelectData images];
        
        CGFloat btnFrameX = 10.0;
        CGFloat Height = self.scrollview.frame.size.height;
        UIButton *button;
        for (int j=0;j<fp.count;j++) {
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            long crt;
            crt=[[fp objectAtIndex:j] integerValue]-1;
            // [button setBackgroundColor:[UIColor orangeColor]];
            
            [button setBackgroundImage:imageArray[crt] forState:UIControlStateNormal];
            // button setBackgroundImage:imageArray[j]]
            // [button.titleLabel setFont:[UIFont systemFontOfSize:20.0f]];
            //[button setTitle:text forState:UIControlStateNormal];
            [button setContentMode:UIViewContentModeScaleAspectFit];
            button.frame = CGRectMake(btnFrameX, 0, Height, Height);
            
            NSString *tit=[NSString stringWithFormat:@"%ld", crt+1];
            [button setTitle:tit forState:UIControlStateNormal];
            button.titleLabel.layer.opacity = 0.0f;
            
            [button addTarget:self action:@selector(func:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.scrollview addSubview:button];
            
            btnFrameX = btnFrameX + Height + 5;
        }
        
        CGSize contentSize = self.scrollview.frame.size;
        contentSize.width = fp.count * (Height+10);
        contentSize.height=Height;
        self.scrollview.contentSize = contentSize;
        /*
         NSMutableArray *wordsArray = [NSMutableArray arrayWithObjects:@"AAA", @"BBB", @"CCCC", @"dd", @"eeeee", @"ffff", @"g", @"hhh", @"iiiiiii",  @"jjjj", @"kkkkk", @"lllll", nil];
         
         CGFloat btnFrameX = 10.0;
         CGFloat Width = self.scrollview.frame.size.width;
         CGFloat Height = self.scrollview.frame.size.height;
         UIButton *button;
         for (NSString *text in wordsArray) {
         
         button = [UIButton buttonWithType:UIButtonTypeCustom];
         [button setBackgroundColor:[UIColor orangeColor]];
         [button.titleLabel setFont:[UIFont systemFontOfSize:20.0f]];
         [button setTitle:text forState:UIControlStateNormal];
         
         button.frame = CGRectMake(btnFrameX, 20, Width, Height);
         
         [self.scrollview addSubview:button];
         
         btnFrameX = btnFrameX + Width + 5;
         }
         
         CGSize contentSize = self.scrollview.frame.size;
         contentSize.width = wordsArray.count * (Width + btnFrameX);
         self.scrollview.contentSize = contentSize;
         */
        
        
        
        
        
        url_string = [NSString stringWithFormat: @"https://mysmartech.ru/Qi/countios.php"];
        data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        cnt=[json count];
        NSMutableArray *cios=[[NSMutableArray alloc] init];
        
        for (int i=0; i<cnt; i++) {
            
            NSString *x=[NSString stringWithFormat:@"%@",json[i]];
            NSString *y=[x substringWithRange:NSMakeRange(6, [x length]-8)];
            
            [cios addObject:y];
        }
        
        
        
        CGFloat btnFrameX1 = 10.0;
        CGFloat Height1 = self.topscrollview.frame.size.height;
        UIButton *button1;
        CGFloat h=[UIScreen mainScreen].bounds.size.height;
        if(h<680){
            Height1=Height1-100;
            // CGSize scrollableSize = CGSizeMake(Width1, Height1);
            //[self.topscrollview setContentSize:scrollableSize];
        }
        for (NSUInteger j=0;j<cios.count;j++) {
            
            button1 = [UIButton buttonWithType:UIButtonTypeCustom];
            
            long crt;
            crt=[[cios objectAtIndex:j] integerValue];
            NSString *urlstring=[NSString stringWithFormat:@"https://mysmartech.ru/Qi/Qitop/top%li.png",crt];
            NSURL  *url = [NSURL URLWithString:urlstring];
            NSData *urlData = [NSData dataWithContentsOfURL:url];
            
            
            
            if ( urlData )
            {
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                NSString *documentsDirectory = [paths objectAtIndex:0];
                NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,[NSString stringWithFormat:@"top%li.png",j]];
                [urlData writeToFile:filePath atomically:YES];
                UIImage *image1=[UIImage imageWithContentsOfFile:filePath];
                //   self.imageView.image=image1;
                
                [button1 setBackgroundImage:image1 forState:UIControlStateNormal];
                // button setBackgroundImage:imageArray[j]]
                // [button.titleLabel setFont:[UIFont systemFontOfSize:20.0f]];
                //[button setTitle:text forState:UIControlStateNormal];
            }
            NSString *tit=[NSString stringWithFormat:@"%ld", crt];
            [button1 setTitle:tit forState:UIControlStateNormal];
            button1.titleLabel.layer.opacity = 0.0f;
            
            [button1 addTarget:self action:@selector(func:) forControlEvents:UIControlEventTouchUpInside];
            button1.frame = CGRectMake(btnFrameX1, 0, 2*Height1/3, Height1);
            
            [self.topscrollview addSubview:button1];
            
            btnFrameX1 = btnFrameX1 + (2*Height1/3) + 5;
        }
        
        CGSize contentSize1 = self.topscrollview.frame.size;
        contentSize1 = CGSizeMake(cios.count * ((2*Height1/3)+10),Height1);
        self.topscrollview.contentSize = contentSize1;
        
        
    }
    
    
    

    
}
-(void)func:(UIButton*)sender{
    NSString *tr=sender.titleLabel.text;

    int n=tr.intValue-1;
    [SelectData setsendbool:YES];
    NSMutableArray *btnarr=[[NSMutableArray alloc]init];
    NSString *strrow=[NSString stringWithFormat:@"%i",n+1];
    [btnarr addObject:[SelectData title][n]];
    [btnarr addObject:[SelectData description][n]];
    [btnarr addObject:[SelectData phone][n]];
    [btnarr addObject:[SelectData lat][n]];
    [btnarr addObject:[SelectData lng][n]];
    [btnarr addObject:[SelectData text][n]];
    [btnarr addObject:strrow];
    [SelectData setcim:n];
    [SelectData setsenddata:btnarr];
    
    
    DetailViewController *monitorMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    UINavigationController* nav=[[UINavigationController alloc]initWithRootViewController:monitorMenuViewController];
    
    
    [self.navigationController presentViewController:nav animated:NO completion:nil];

}


- (BOOL)connected
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    
    if ([reach isReachable]) {
        return TRUE;
    }
    else {
        return FALSE;
    }
}


/*
- (IBAction)about:(id)sender {
    [(UITabBarController *)self.tabBarController setSelectedIndex:1];
}

- (IBAction)cafes:(id)sender {
    [(UITabBarController *)self.tabBarController setSelectedIndex:2];

}*/



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrdata.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LngCell"];
    if (cell == nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"LngCell"];
    }
  
    UILabel *lbl1=(UILabel *)[cell viewWithTag:1];
    lbl1.text=[arrdata objectAtIndex:[indexPath row]];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) //Name Row Access  // Index Value = 0
    {
        
        [LanguageManager saveLanguageByIndex:1];
        
        [self reloadRootViewController];
       
    }
    else if (indexPath.row == 1) // Password Row Access // Index Value =1
    {
        [LanguageManager saveLanguageByIndex:0];
        [self reloadRootViewController];
        
        
    }
}



- (IBAction)btnmenu:(id)sender
{
    /*CGFloat width = [UIScreen mainScreen].bounds.size.width;
    sidebar.hidden=NO;
    if (!isSideViewOpen)
    {
        isSideViewOpen=true;
        [sidebar setFrame:CGRectMake(width,0,width,80)];
        [UIView beginAnimations:@"TableAnimation" context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.2];
        [sidebar setFrame:CGRectMake(width-100,0,width,80)];
        [UIView commitAnimations];
    }
    else
    {
        isSideViewOpen=false;
        sidebar.hidden=YES;
        [sidebar setFrame:CGRectMake(width,0,width,80)];
        [UIView beginAnimations:@"TableAnimation" context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.2];
        [sidebar setFrame:CGRectMake(width-100,0,width,80)];
        [UIView commitAnimations];
    }
    
    */
    
}
- (void)reloadRootViewController
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSString *storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    delegate.window.rootViewController = [storyboard instantiateInitialViewController];
}


- (IBAction)langArm:(id)sender {
    [LanguageManager saveLanguageByIndex:1];
    
    [self reloadRootViewController];
}

- (IBAction)langEng:(id)sender {
    [LanguageManager saveLanguageByIndex:0];
    
    [self reloadRootViewController];
}
@end
