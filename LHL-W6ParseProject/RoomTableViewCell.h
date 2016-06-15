//
//  RoomTableViewCell.h
//  LHL-W6ParseProject
//
//  Created by Asuka Nakagawa on 2016-06-14.
//  Copyright © 2016 Asuka Nakagawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *roomNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postedByLabel;

@end
