//
//  CustomTableViewCell.m
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-15.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell ()

@property Todo *todoItem;

@end


@implementation CustomTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
-(void)configureCell: (Todo *)todo{
	self.todoItem = todo;
	
	if(self.todoItem.completed){
		NSMutableAttributedString *attributeName = [[NSMutableAttributedString alloc] initWithString:self.todoItem.title];
		[attributeName addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [attributeName length])];
		
		NSMutableAttributedString *attributeDescription = [[NSMutableAttributedString alloc] initWithString:self.todoItem.todoDescription];
		[attributeDescription addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [attributeDescription length])];
		
		NSMutableAttributedString *attributePriority = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@"%ld", self.todoItem.priority]];
		[attributePriority addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [attributePriority length])];
		
		self.labelName.attributedText = attributeName;
		self.labelDescription.attributedText = attributeDescription;
		self.labelPriority.attributedText = attributePriority;
	}
	else{
		self.labelName.text = self.todoItem.title;
		self.labelDescription.text = self.todoItem.todoDescription;
		self.labelPriority.text = [NSString stringWithFormat:@"%ld", self.todoItem.priority];
	}
	
}

@end
