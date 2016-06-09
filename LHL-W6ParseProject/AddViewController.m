//
//  AddViewController.m
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-08.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController {
//    CLLocationManager *locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    locationManager = [CLLocationManager new];
    
    MKPointAnnotation *lougheed = [[MKPointAnnotation alloc] init];
    lougheed.title = @"Lougheed Town Centre";
//    lougheed.subtitle = @"... and Launch Academy";
    lougheed.coordinate = CLLocationCoordinate2DMake(49.248502, -122.896991);
    
    [self.mapView addAnnotation:lougheed];

    
    
}

//- (IBAction)getLocationPressed:(UIButton *)sender {
//
//    // locationManager is the object that provides the location data
//    locationManager.delegate = self;
//    
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    
//    // get current location data continuously
//    [locationManager startUpdatingLocation];
//}

//#pragma mark - CLLocationManagerDelegate
//- (void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error {
//    NSLog(@"didFailWithError: %@", error);
//    
//    UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Failed to get your current location" preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
//        
//    }];
//    // add action to UIAlertController
//    [errorAlert addAction:ok];
//}
//
//- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
//    NSLog(@"didUpdateToLocation: %@", newLocation);
//    CLLocation *currentLocation = newLocation;
//    
//    if (currentLocation != nil) {
//        self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
//        self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
//    }
//}

- (IBAction)saveButtonPressed:(UIButton *)sender {
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
