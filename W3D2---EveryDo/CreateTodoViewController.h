//
//  CreateTodoViewController.h
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol TodoDelegate <NSObject>

-(void) makeNewTodo:(Todo *)newTodo;

@end

@interface CreateTodoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priority;
@property (weak, nonatomic) IBOutlet UITextField *descriptionLabel;

@property id<TodoDelegate> delegate;

-(void)saveIt:(Todo *)todo;

@end
