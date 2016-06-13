//
//  Room.m
//  
//
//  Created by Asuka Nakagawa on 2016-06-08.
//
//

#import "Room.h"

@implementation Room

// create accessor methods(getter, setter)
@synthesize name;
@synthesize address;
@synthesize postedBy;
//@synthesize

+ (NSString *)parseClassName {
    return @"Room";
}

@end
