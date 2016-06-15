//
//  Room.m
//  
//
//  Created by Asuka Nakagawa on 2016-06-08.
//
//

#import "Room.h"

@implementation Room

// Declare a property as you normally would, but use @dynamic rather than @synthesize in your .m file.
@dynamic name;
@dynamic address;
@dynamic postedBy;
@dynamic latAndLon;

//@dynamic roomArray;
//@synthesize

//+ (void)load {
//    [self registerSubclass];
//}

+ (NSString *)parseClassName {
    return @"Room";
}

@end
