//
//  RoomTableViewController.m
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-09.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "RoomTableViewController.h"
#import "Room.h"
#import "DetaildViewController.h"
#import "RoomTableViewCell.h"


@interface RoomTableViewController ()


@end

@implementation RoomTableViewController

- (id)initWithCoder:(NSCoder *)aCoder {
    
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Room";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"name";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // by default, it shows 25objects/page ->10
        self.objectsPerPage = 10;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshTable:)
                                                 name:@"refreshTable"
                                               object:nil];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

-(void)refreshTable:(NSNotification*) notification {
//    // reload the rooms
//    [self loadObjects];
}

//
//-(void)viewDidUnload {
//    // Release any retained subviews of the main view.
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"refreshTable" object:nil];
//    [super viewDidUnload];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(nullable PFObject *)object {
    
    RoomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    // casting object to subclass of Room
    // cell.roomNameLabel.text = ((Room*)object).name
    
    Room *room = (Room*) object;
    
    cell.roomNameLabel.text = room.name;
    cell.postedByLabel.text = room.postedBy.username;
    
    return cell;
}

-(PFQuery *)queryForTable {
//    PFQuery *query = [PFQuery queryWithClassName:@"Room"];
    
    // there is an array of userInfo in the postedBy:pointer
    PFQuery *query = [Room query];
    [query includeKey:@"postedBy"];
    return query;

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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"DetaildIdentifier"]) {
        
        DetaildViewController *dvc = segue.destinationViewController;
        
        RoomTableViewCell *cell = sender;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        //        PFQuery *query = [self queryForTable];
        
        // create room Object, set as object in the array of Room objects
        Room *room = [self.objects objectAtIndex:indexPath.row];
        
        // set specific cell has specific data
        //        dvc.room = query.room;
        
        // 1. inside the DetailedVC, create new Property(to pass room object from roomTableVC to dvc)
        dvc.room = room;

    }
}


@end
