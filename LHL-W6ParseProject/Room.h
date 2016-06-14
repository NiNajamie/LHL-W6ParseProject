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
@property (nonatomic) NSString *postedBy;

//@property (nonatomic) PFFile *mapFile;


@end
