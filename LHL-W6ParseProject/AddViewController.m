//
//  AddViewController.m
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-08.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import "AddViewController.h"
#import "Room.h"

@interface AddViewController ()

@property (nonatomic) CLLocationManager *locationManager;
//@property (nonatomic) CLGeocoder *geocoder;
@property (nonatomic) CLPlacemark *placemark;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTextField.delegate = self;
    self.locationManager.delegate = self;
    
    [self.locationManager requestAlwaysAuthorization];
    
//    [self.locationManager startUpdatingLocation];
    
    
    
    MKPointAnnotation *lhl = [[MKPointAnnotation alloc] init];
    lhl.title = @"Lighthouse Labs";
    lhl.subtitle = @"128 W.Hastings Street, Vancouver, BC, Canada";
    lhl.coordinate = CLLocationCoordinate2DMake(49.281887, -123.108188);
    
    // add pin in the map
    [self.mapView addAnnotation:lhl];
    
    // CLLocationCoordinate2D contains a geographical coordinate
    CLLocationCoordinate2D aLocation = lhl.coordinate;
    
    // set distance from aLocation, 200x200<- too close
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(aLocation, 2000, 2000);
//    
//    // Adjusts the aspect ratio of the specified region to ensure that it fits in the map view’s frame.
    MKCoordinateRegion adjustRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustRegion animated:TRUE];
    
//    // A Boolean value indicating whether the map should try to display the user’s location.
//    self.mapView.showsUserLocation = TRUE;

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    // Placemark data can be information such as the country, state, city, and street address.
    [geocoder geocodeAddressString:lhl.subtitle completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        // get latitude/logitude from the map
        CLPlacemark *firstPlace = placemarks.firstObject;
        NSLog(@"%@", firstPlace.location);
        
        self.latitudeLabel.text = [NSString stringWithFormat:@"  %.8f", firstPlace.location.coordinate.latitude];
        self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", firstPlace.location.coordinate.longitude];
        NSLog(@"Latitude: %@, Longitude: %@", self.latitudeLabel.text, self.longitudeLabel.text);
        
        [geocoder reverseGeocodeLocation:firstPlace.location completionHandler:^(NSArray *placemarks, NSError *error) {
            if (!error) {
                
                for (CLPlacemark* aPlacemark in placemarks)
                {
                    NSLog(@"place--%@", [aPlacemark locality]);
                    NSLog(@"lat--%f\nlong--%f",aPlacemark.location.coordinate.latitude,aPlacemark.location.coordinate.longitude);
                }
            }
            else{
                
                NSLog(@"error--%@",[error localizedDescription]);
            }
            
             //CLPlacemarkArray
//             NSMutableString *string = [[NSMutableString alloc] init];
             
//           if (Value ==nil) {
//           [NSMutableString appendString:placemarks]
//           }
             
             self.addressLabel.text = [NSString stringWithFormat:@" %@ %@\n %@ %@\n %@\n %@",firstPlace.subThoroughfare, firstPlace.thoroughfare, firstPlace.postalCode, firstPlace.locality, firstPlace.administrativeArea, firstPlace.country];
             
             NSLog(@"%@ %@\n %@ %@\n %@\n %@",firstPlace.addressDictionary, firstPlace.thoroughfare, firstPlace.postalCode, firstPlace.locality, firstPlace.administrativeArea, firstPlace.country);
             
         }];
    }];
}


#pragma mark - CLLocationManagerDelegate


- (IBAction)saveButtonPressed:(UIButton *)sender {
    
//    // create new room object
//    PFObject *room = [[PFObject alloc] initWithClassName:@"Room"];
//    [room setObject:self.nameTextField.text forKey:@"name"];
//    [room setObject:self.addressLabel.text forKey:@"address"];
//    [room setObject:self.mapView forKey:@"mapview"];
    
}
- (void)viewDidUnload {
//    [self setNameTextField:nil];
//    [self setMapView:nil];
//    [self setAddressLabel:nil];
//    
//    [super viewDidUnload];
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
