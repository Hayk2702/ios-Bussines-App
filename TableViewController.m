//
//  TableViewController.m
//  PowerBank
//
//  Created by Qocharyan on 8/18/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "TableViewController.h"
#import "MapViewController.h"
#import "DetailViewController.h"
#import "help.h"
#import "Reachability.h"
#import "SelectData.h"
@interface TableViewController ()

@end

@implementation TableViewController{
 UIView* loadingView;
 Reachability *internetReachableFoo;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [SelectData setsendbool:NO];
    
    
    if([self connected]==YES){

    
        title=[SelectData title];
        description=[SelectData description];
        Phone=[SelectData phone];
        Text=[SelectData text];
        lat=[SelectData lat];
        lng=[SelectData lng];
        image=[SelectData images];
        NSUInteger cnt=[title count];

      
  
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *dic1=[[NSMutableDictionary alloc] init];

    for(int i=0;i<cnt;i++){
        [dic setObject:Phone[i] forKey:title[i]];
        [dic1 setObject:[NSString stringWithFormat:@"img%i.png",i+1] forKey:title[i]];
    }
    [help setDict:dic];
    [help setimage:dic1];
   
    
 

  
    
    
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    }
    
    else {
        loadingView = [[UIView alloc]initWithFrame:CGRectMake(150, 200, 80, 80)];
        loadingView.backgroundColor = [UIColor colorWithWhite:0. alpha:0.6];
        loadingView.layer.cornerRadius = 5;
        UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityView.center = CGPointMake(loadingView.frame.size.width / 2.0, 35);
        [activityView startAnimating];
        activityView.tag = 100;
        [loadingView addSubview:activityView];
        UILabel* lblLoading = [[UILabel alloc]initWithFrame:CGRectMake(0, 48, 80, 30)];
        lblLoading.text = @"Loading...";
        lblLoading.textColor = [UIColor whiteColor];
        lblLoading.font = [UIFont fontWithName:lblLoading.font.fontName size:15];
        lblLoading.textAlignment = NSTextAlignmentCenter;
        [loadingView addSubview:lblLoading];
        [self.view addSubview:loadingView];
    }
    
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



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return title.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.cellTitle.text=title[indexPath.row];
    cell.cellDescription.text=description[indexPath.row];
    cell.cellImageView.image=image[indexPath.row];

    
    
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"showDetail"]){
        DetailViewController *detailView=[segue destinationViewController];
        NSIndexPath *myIndexPath=[self.tableView indexPathForSelectedRow];

        int row=(int)[myIndexPath row];
        NSString *strrow=[NSString stringWithFormat:@"%i",row+1];
        detailView.detailModal=@[title[row], description[row],Phone[row],lat[row],lng[row],Text[row],strrow];
    }
    if([[segue identifier] isEqualToString:@"shd1"]){
        MapViewController *detailView=[segue destinationViewController];
        NSIndexPath *myIndexPath=[self.tableView indexPathForSelectedRow];

        int row=(int)[myIndexPath row];
        detailView.detailModal1=@[lat[row],lng[row]];
    }
}


@end
