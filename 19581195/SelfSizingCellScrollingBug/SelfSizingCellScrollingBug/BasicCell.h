//
//  BasicCell.h
//  SelfSizingCellScrollingBug
//
//  Created by Indragie on 1/23/15.
//  Copyright (c) 2015 Indragie Karunaratne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *growingLabel;
@end
