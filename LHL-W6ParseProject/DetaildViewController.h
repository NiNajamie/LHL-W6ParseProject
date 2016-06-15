//
//  DetaildViewController.h
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-14.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

// UITableViewController-> UIVC
@interface DetaildViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *postedByLabel;



@end
