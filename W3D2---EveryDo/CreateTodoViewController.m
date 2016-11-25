//
//  CreateTodoViewController.m
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import "CreateTodoViewController.h"

@interface CreateTodoViewController ()

@property (nonatomic) NSManagedObjectContext *context;

@end

@implementation CreateTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveIt:)];
	self.navigationItem.rightBarButtonItem = saveButton;
}

-(void)saveIt:(TodoItem *)todo{
	//Get Context for Core Data
	self.context = [DataManager sharedInstance].persistentContainer.viewContext;
	
	//Create a new item
	TodoItem *newObject = [NSEntityDescription insertNewObjectForEntityForName:@"TodoItem"
														inManagedObjectContext:self.context];
	
	//Set its details
	newObject.title = self.titleLabel.text;
	newObject.todoDescription = self.descriptionLabel.text;
	newObject.priority = [self.priority titleForSegmentAtIndex:self.priority.selectedSegmentIndex];
	
	//save the new item
	[[DataManager sharedInstance] saveContext];
	
	[self.navigationController popToRootViewControllerAnimated:YES];
	
}


@end
