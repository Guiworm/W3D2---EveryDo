//
//  CreateTodoViewController.m
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import "CreateTodoViewController.h"

@interface CreateTodoViewController ()


@end

@implementation CreateTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveIt:)];
	self.navigationItem.rightBarButtonItem = saveButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//*titleLabel;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *priority;
//@property (weak, nonatomic) IBOutlet UITextField *descriptionLabel;

-(void)saveIt:(Todo *)todo{
	if([self.delegate respondsToSelector:@selector(makeNewTodo:)]){
		Todo *newTodo = [Todo new];
		newTodo.title = self.titleLabel.text;
		newTodo.todoDescription = self.descriptionLabel.text;
		newTodo.priority = self.priority.tag;

		
		[self.delegate makeNewTodo:newTodo];
		[self.navigationController popToRootViewControllerAnimated:YES];
	}
}


@end
