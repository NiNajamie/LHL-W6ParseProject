//
//  AddViewController.m
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-08.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (nonatomic) CLLocationManager *locationManager;
//@property (nonatomic) CLGeocoder *geocoder;
@property (nonatomic) CLPlacemark *placemark;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.locationManager requestAlwaysAuthorization];
    
    MKPointAnnotation *lougheed = [[MKPointAnnotation alloc] init];
    lougheed.title = @"Lougheed Town Centre, Burnaby, Canada";
    lougheed.coordinate = CLLocationCoordinate2DMake(49.248502, -122.896991);
    
    // add pin in the map
    [self.mapView addAnnotation:lougheed];
    
    // CLLocationCoordinate2D contains a geographical coordinate
    CLLocationCoordinate2D aLocation = lougheed.coordinate;
    
    // set distance from aLocation, 200x200<- too close
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(aLocation, 2000, 2000);
    
    // Adjusts the aspect ratio of the specified region to ensure that it fits in the map view’s frame.
    MKCoordinateRegion adjustRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustRegion animated:TRUE];
    
    // A Boolean value indicating whether the map should try to display the user’s location.
    self.mapView.showsUserLocation = TRUE;
    
    
//    // prepare: converting the latitude/logitude into address
//    self.locationManager = [[CLLocationManager alloc]init];

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    // Placemark data can be information such as the country, state, city, and street address.
    [geocoder geocodeAddressString:lougheed.title completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        // get latitude/logitude from the map
        CLPlacemark *firstPlace = placemarks.firstObject;
//        NSLog(@"%@", firstPlace.location);
        
        self.latitudeLabel.text = [NSString stringWithFormat:@"  %.8f", firstPlace.location.coordinate.latitude];
        self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", firstPlace.location.coordinate.longitude];
        NSLog(@"Latitude: %@, Longitude: %@", self.latitudeLabel.text, self.longitudeLabel.text);
        
        [geocoder reverseGeocodeLocation:firstPlace.location
                       completionHandler:^(NSArray *placemarks, NSError *error)
         {
             if (error) {
                 NSLog(@"Geocode failed with error: %@", error);
                 return;
             }
             
             NSMutableString *string = [[NSMutableString alloc] init];
             
             
             
//           if ( !=nil) {
//           [NSMutableString appendString:]
//           }
             
             self.addressLabel.text = [NSMutableString stringWithFormat:@" %@ %@\n %@ %@\n %@\n %@",firstPlace.addressDictionary[@"Name"], firstPlace.thoroughfare, firstPlace.postalCode, firstPlace.locality, firstPlace.administrativeArea, firstPlace.country];
             
             NSLog(@"%@ %@\n %@ %@\n %@\n %@",firstPlace.addressDictionary, firstPlace.thoroughfare, firstPlace.postalCode, firstPlace.locality, firstPlace.administrativeArea, firstPlace.country);
             
         }];
        

    }];
}


#pragma mark - CLLocationManagerDelegate


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
