//
//  Todo.m
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title andTodoDescription:(NSString *)todoDescription andPriority:(NSString *)priority
{
	self = [super init];
	if (self) {
		_title = title;
		_todoDescription = todoDescription;
		_priority = priority;
		_completed = NO;
	}
	return self;
}

@end
