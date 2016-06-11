//
//  Room.h
//  
//
//  Created by Asuka Nakagawa on 2016-06-08.
//
//

#import <Parse/Parse.h>

@interface Room : PFObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;
@property (nonatomic) PFFile *mapFile;


@end
