//
//  DetaildViewController.m
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-14.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "DetaildViewController.h"
#import "Room.h"
#import "AddViewController.h"

@interface DetaildViewController ()

@end


@implementation DetaildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.room.name;
    self.addressLabel.text = self.room.address;
    self.postedByLabel.text = self.room.postedBy.username;
    
//    PFQuery *query = [Room query];
//    [query includeKey:@"postedBy"];
//    [query whereKey:"name" equalTo:"inlet"];
//    
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        
//        if (!error) {
//            
//            // The find succeeded.
//            NSLog(@"Successfully retrieved %lu rooms", (unsigned long)objects.count);
//            
//            // Do something with the found objects
//            // PFUser *object, [object Key:@"name"]-> Room *room
//            for (Room *room in objects) {
//                
//                NSLog(@"%@",room.name);
//                
//                // get data from Parse for displaying
//                self.nameLabel.text = room.name;
//                self.postedByLabel.text = room.postedBy.username;
//                self.addressLabel.text = room.address;
//            }
//        } else {
//            // Log details of the failure
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 3;
//}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    
//    return cell;
//}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
