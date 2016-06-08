//
//  ViewController.h
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-08.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@end

