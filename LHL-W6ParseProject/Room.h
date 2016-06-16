//
//  Room.h
//  
//
//  Created by Asuka Nakagawa on 2016-06-08.
//
//

#import <Parse/Parse.h>

@interface Room : PFObject<PFSubclassing>


@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;
@property (nonatomic) PFUser *postedBy;
@property (nonatomic) PFGeoPoint *latAndLon;

@property (nonatomic) PFFile *imageFile;

//@property (nonatomic) NSArray *roomArray;

//@property (nonatomic) PFFile *mapFile;


@end
