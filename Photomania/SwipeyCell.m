//
//  SwipeyCell.m
//  Photomania
//
//  Created by la-la land on 4/15/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "SwipeyCell.h"

@implementation SwipeyCell
/*
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    [self.backgroundView setBackgroundColor : [UIColor  colorWithWhite: 1.0 alpha: 1.0]];
    return self;
}

- (void)viewWillLoad:(BOOL) animated
{
    [self.contentView setBackgroundColor : [UIColor  colorWithWhite: 1.0 alpha: 1.0]];
    // Configure the view for the selected state
}
*/

CGPoint startPoint;
BOOL    colorSet;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    [self.textLabel setTextColor:[UIColor blackColor]];


    // Configure the view for the selected state
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch *touch = [touches anyObject];
    startPoint = [touch locationInView:self];
    [super touchesBegan:touches withEvent:event];
    colorSet = false;
    [self.textLabel setTextColor:[UIColor blackColor]];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *) event
{
	int count;
	NSArray *allTouches = [touches allObjects];
	count = [allTouches count];
	
    CGPoint currentPosition =	[[allTouches objectAtIndex:0] locationInView:self];
    CGPoint lastPosition = [[allTouches objectAtIndex:0] previousLocationInView:self];
    CGFloat xDif = lastPosition.x - currentPosition.x;
    CGFloat ySDif = lastPosition.y - startPoint.y;
    
  //  [self.contentView setOpaque:YES];
    
    if(!colorSet)
    {
    if( (currentPosition.x>startPoint.x) /*&& (currentPosition.x>startPoint.x)*/)
    {    [self.superview setBackgroundColor: [UIColor redColor]];
         colorSet = true;
    }
    if( (currentPosition.x<startPoint.x) /*&& (currentPosition.x<startPoint.x)*/)
    {    [self.superview setBackgroundColor: [UIColor greenColor]];
         colorSet = true;
    }
    }
    if( fabs(ySDif) >40 )
    {
        
        CGRect f = self.frame;
        f.origin.x = self.superview.frame.origin.x;
        self.frame = f;
        [self.superview setBackgroundColor: [UIColor whiteColor]];
    }
    else
    {
        CGRect f = self.frame;
        f.origin.x = self.frame.origin.x-xDif;
    
        f.size.width = self.frame.size.width;
        self.frame = f;
    }
    [super touchesMoved:touches withEvent:event];
    [self.textLabel setTextColor:[UIColor blackColor]];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.superview setBackgroundColor: [UIColor whiteColor]];
    [super touchesEnded:touches withEvent:event];
    CGRect f = self.frame;
    f.origin.x = self.superview.frame.origin.x;
    self.frame = f;
    colorSet = false;
    [self.textLabel setTextColor:[UIColor blackColor]];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.superview setBackgroundColor: [UIColor whiteColor]];
    [super touchesCancelled:touches withEvent:event];
    CGRect f = self.frame;
    f.origin.x = self.superview.frame.origin.x;
    self.frame = f;
    colorSet = false;
    [self.textLabel setTextColor:[UIColor blackColor]];

}



- (void) setBackgroundColor:(UIColor *)color {
    [super setBackgroundColor:[UIColor whiteColor]];
    [self.textLabel setTextColor:[UIColor blackColor]];
 //   [titleLabel setBackgroundColor:color];
  //  [imageView setBackgroundColor:color];
//[timeLabel setBackgroundColor:color];
}

@end
