//
//  CustomTableViewCell.m
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell ()

@end


@implementation CustomTableViewCell

//-(void)configureCell: (TodoItem *)todo{


//}

- (void)configureCellwithEvent:(TodoItem *)todo {
	
	if(todo.completed){
		NSMutableAttributedString *attributeName = [[NSMutableAttributedString alloc] initWithString:todo.title];
		[attributeName addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [attributeName length])];

		NSMutableAttributedString *attributeDescription = [[NSMutableAttributedString alloc] initWithString:todo.description];
		[attributeDescription addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [attributeDescription length])];

		NSMutableAttributedString *attributePriority = [[NSMutableAttributedString alloc] initWithString: todo.priority];
		[attributePriority addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [attributePriority length])];

		self.labelName.attributedText = attributeName;
		self.labelDescription.attributedText = attributeDescription;
		self.labelPriority.attributedText = attributePriority;
	}
	else{
		self.labelName.text = todo.title;
		self.labelDescription.text = todo.todoDescription;
		self.labelPriority.text = todo.priority;
	}
	
	
}


@end
