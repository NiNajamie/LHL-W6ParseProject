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
    
    
    self.nameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.emailTextField.delegate = self;
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameTextField || textField == self.passwordTextField || textField ==self.emailTextField) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}



// allow user to sign-up
- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    // create new UserObject
    PFUser *user = [PFUser user];
    user.username = self.nameTextField.text;
    user.password = self.passwordTextField.text;
    user.email = self.emailTextField.text;
    
//    user.username = @"asuka";
//    user.password = @"asuka's pass";
//    user.email = @"asuka@example.com";
    
    
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {
            // show success msg
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login complete"
                                                                           message:@"You're successfully login"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action) {
                                                       }];
            // add & present(show) in VC
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
            
        } else {
           // Show the errorString somewhere and let the user try again.
//            NSString *errorString = [error userInfo][@"error"];
            
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                message:@"Your input was invalid.\n Go back to Log in field."
                                                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action) {
//                                                           NSLog(@"%@", action);
//                                                           NSLog(@"%@", PFUser.currentUser.username);
                                                           [self.navigationController popToRootViewControllerAnimated:YES];

                                 }];
            [errorAlert addAction:ok];
            
            [PFUser logInWithUsernameInBackground:user.username password:user.password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
                
                if (!error){
                    NSLog(@"Successfully logged in");

                }else {
                    NSLog(@"Error in login, %@", error);
                    
                    // alertViewController is becoming a part of stack of navi
                    [self.navigationController presentViewController:errorAlert animated:YES completion:nil];
//                    [self presentViewController:errorAlert animated:YES completion:nil];

                }
                
            }];

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
