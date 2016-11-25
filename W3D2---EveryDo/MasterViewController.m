//
//  MasterViewController.m
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"
#import "AppDelegate.h"
#import "EveryDo+CoreDataModel.h"

@import CoreData;

@interface MasterViewController ()

@property (nonatomic) NSManagedObjectContext *context;

- (void)configureCell:(CustomTableViewCell *)cell withEvent:(TodoItem *)todo;


@end

@implementation MasterViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	
	self.context = [DataManager sharedInstance].persistentContainer.viewContext;
	
}

-(void) viewWillAppear:(BOOL)animated{
	[self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
	return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
	
	TodoItem *newTodo = [self.fetchedResultsController objectAtIndexPath:indexPath];
	
	[cell configureCellwithEvent: newTodo];
	
	return cell;
}


- (IBAction)crossItOff:(UISwipeGestureRecognizer *)sender {
//	CGPoint point = [sender locationInView:self.tableView];
//	NSIndexPath *swipePath = [self.tableView indexPathForRowAtPoint:point];
//	CustomTableViewCell *swipedCell = [self.tableView cellForRowAtIndexPath:swipePath];
//	swipedCell.todoItem.completed = !swipedCell.todoItem.completed;
//	[self.tableView reloadRowsAtIndexPaths:@[swipePath] withRowAnimation:UITableViewRowAnimationRight];
}

#pragma mark - Fetched results controller
- (void)configureCell:(CustomTableViewCell *)cell withEvent:(TodoItem *)todo {
	cell.labelName.text = todo.title;
	cell.labelDescription.text = todo.description;
	cell.labelPriority.text = todo.priority;
}


- (NSFetchedResultsController<TodoItem *> *)fetchedResultsController
{
	if (_fetchedResultsController != nil) {
		return _fetchedResultsController;
	}
	
	NSFetchRequest<TodoItem *> *fetchRequest = TodoItem.fetchRequest;
	
	// Set the batch size to a suitable number.
	[fetchRequest setFetchBatchSize:20];
	
	// Edit the sort key as appropriate.
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"priority" ascending:NO];
	
	[fetchRequest setSortDescriptors:@[sortDescriptor]];
	
	// Edit the section name key path and cache name if appropriate.
	// nil for section name key path means "no sections".
	NSFetchedResultsController<TodoItem *> *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:@"Master"];
	aFetchedResultsController.delegate = self;
	
	NSError *error = nil;
	if (![aFetchedResultsController performFetch:&error]) {
		// Replace this implementation with code to handle the error appropriately.
		// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
		NSLog(@"Unresolved error %@, %@", error, error.userInfo);
		abort();
	}
	
	_fetchedResultsController = aFetchedResultsController;
	return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
	[self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
		   atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
	switch(type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		default:
			return;
	}
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
	   atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
	  newIndexPath:(NSIndexPath *)newIndexPath
{
	UITableView *tableView = self.tableView;
	
	switch(type) {
		case NSFetchedResultsChangeInsert:
			[tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeUpdate:
			//[self configureCell:[tableView cellForRowAtIndexPath:indexPath] withEvent:anObject];
			break;
			
		case NSFetchedResultsChangeMove:
			[tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
			break;
	}
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
	[self.tableView endUpdates];
}

@end
