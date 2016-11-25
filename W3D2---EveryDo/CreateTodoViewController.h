//
//  CreateTodoViewController.h
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EveryDo+CoreDataModel.h"
#import "DataManager.h"

@interface CreateTodoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priority;
@property (weak, nonatomic) IBOutlet UITextField *descriptionLabel;

-(void)saveIt:(TodoItem *)todo;

@end
