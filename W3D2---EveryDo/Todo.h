//
//  Todo.h
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property NSString *title;
@property NSString *todoDescription;
@property NSInteger priority;
@property BOOL completed;


- (instancetype)initWithTitle:(NSString *)title andTodoDescription:(NSString *)todoDescription andPriority:(NSInteger)priority;

@end
