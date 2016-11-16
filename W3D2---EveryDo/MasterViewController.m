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
#import "Todo.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property NSMutableArray *todos;

@end

@implementation MasterViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
		self.navigationItem.leftBarButtonItem = self.editButtonItem;

//	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(prepareForSegue:sender:)];
//	self.navigationItem.rightBarButtonItem = addButton;
	
	self.todos = [NSMutableArray new];
	
	Todo *new = [[Todo alloc]initWithTitle:@"thing1" andTodoDescription:@"new thing description 1" andPriority:@"!!!"];
	Todo *new2 = [[Todo alloc]initWithTitle:@"thing2" andTodoDescription:@"new thing description 2" andPriority:@"!!"];
	Todo *new3 = [[Todo alloc]initWithTitle:@"thing3" andTodoDescription:@"new thing description 3" andPriority:@"!"];
	Todo *new4 = [[Todo alloc]initWithTitle:@"thing4" andTodoDescription:@"new thing description 4" andPriority:@"!!"];
	
	new. completed = YES;
	new2.completed = YES;
	new3.completed = YES;
	
	[self.todos addObject:new];
	[self.todos addObject:new2];
	[self.todos addObject:new3];
	[self.todos addObject:new4];
	
	
}

-(void) viewWillAppear:(BOOL)animated{
	[self.tableView reloadData];
}

-(void) makeNewTodo:(Todo *)newTodo{
	if (!self.todos) {
	    self.todos = [[NSMutableArray alloc] init];
	}
	
	[self.todos addObject:newTodo];
//	[self.todos addObject:];
//	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    Todo *todoItem = self.todos[indexPath.row];
	    DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
	    [controller setDetailItem:todoItem];
		
	}
	if ([[segue identifier] isEqualToString:@"addNewTodo"]) {
		CreateTodoViewController *newVC = (CreateTodoViewController *) segue.destinationViewController;
		newVC.delegate = self;
	}
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
	Todo *newTodo = self.todos[indexPath.row];
	
	[cell configureCell: newTodo];
	
	return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}


- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
		[self.todos removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}];
	
	UITableViewRowAction *done = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@" Done " handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
		Todo *todoItem = self.todos[indexPath.row];

		todoItem.completed = !todoItem.completed;
		
		self.todos[indexPath.row] = todoItem;
		
		[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
	}];
	
	done.backgroundColor = [UIColor blueColor];
	
	return @[delete, done];
}

- (IBAction)crossItOff:(UISwipeGestureRecognizer *)sender {
	CGPoint point = [sender locationInView:self.tableView];
	NSIndexPath *swipePath = [self.tableView indexPathForRowAtPoint:point];
	CustomTableViewCell *swipedCell = [self.tableView cellForRowAtIndexPath:swipePath];
	swipedCell.todoItem.completed = !swipedCell.todoItem.completed;
	[self.tableView reloadRowsAtIndexPaths:@[swipePath] withRowAnimation:UITableViewRowAnimationRight];

}

@end
