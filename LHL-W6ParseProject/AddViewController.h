//
//  AddViewController.h
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-08.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface AddViewController : UIViewController <CLLocationManagerDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate>

//@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
//@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet PFImageView *imageView;



@end
