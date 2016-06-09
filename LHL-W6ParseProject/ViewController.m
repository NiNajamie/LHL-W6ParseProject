//
//  ViewController.m
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-08.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextField = _nameTextField;
    self.emailTextField = _emailTextField;
}

// allow user to sign-up
- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    // create new UserObject
    PFUser *user = [PFUser user];
    user.username = @"asuka";
    user.password = @"asuka's pass";
    user.email = @"asuka@example.com";
    
//    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {
            // show success msg
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login complete"
                                                                           message:@"You're successfully login"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                       }];
            // add & present(show)VC
            [alert addAction:ok];
            [alert presentationController];
            
        } else {
            // Show the errorString somewhere and let the user try again.
            NSString *errorString = [error userInfo][@"error"];
            
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                message:@"Your input was invalid."
                                                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action) {
                                 }];
            [errorAlert addAction:ok];
            [errorAlert presentationController];

        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
}


@end
