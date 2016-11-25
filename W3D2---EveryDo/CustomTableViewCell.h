//
//  CustomTableViewCell.h
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EveryDo+CoreDataModel.h"
#import "DataManager.h"

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelPriority;
@property TodoItem *todoItem;

//- (void)configureCell: (TodoItem *)todo;
- (void)configureCellwithEvent:(TodoItem *)todo;



@end
