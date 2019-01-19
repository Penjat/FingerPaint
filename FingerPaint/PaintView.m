//
//  PaintView.m
//  FingerPaint
//
//  Created by Spencer Symington on 2019-01-18.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "PaintView.h"
#import "LineSegment.h"

@interface PaintView()

@property (nonatomic) NSMutableArray<LineSegment *> *line;

@end

@implementation PaintView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _line = [NSMutableArray new];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    // First line segment is from the initial touch point to the initial touch point, so
    // basically a point
    UIColor *curColor = [UIColor colorWithRed:self.redValue green:self.greenValue blue:self.blueValue alpha:1.0];
    
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first
                                                       secondPoint:first color:curColor];
    [self.line addObject:segment];
    
    // Tell the system that we need to be redrawn, so the system will call drawRect: before
    // the end of the current event loop
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint second = [touch locationInView:self];        // Current touch location
    CGPoint first = [touch previousLocationInView:self]; // Previous touch location
    //NSLog(@"%d: %@, %@", __LINE__, NSStringFromCGPoint(first), NSStringFromCGPoint(second));
    // Line segment is from previous touch location to current touch location
    
    UIColor *curColor = [UIColor colorWithRed:self.redValue green:self.greenValue blue:self.blueValue alpha:1.0];
    
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first
                                                       secondPoint:second color:curColor];
    [self.line addObject:segment];
    
    // Tell the system that we need to be redrawn, so the system will call drawRect: before
    // the end of the current event loop
    [self setNeedsDisplay];
}

    
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path;// = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    //UIColor *gray = [UIColor redColor];
    //UIColor *curColor = [UIColor colorWithRed:self.redValue green:self.greenValue blue:self.blueValue alpha:1.0];
    UIColor *curColor;
    
    
    // Loop through all elements in the segment array and draw each line
    for (LineSegment *segment in self.line) {
        if([curColor isEqual:segment.myColor] == NO){
            if(path != nil){
                
                [path stroke];
                
            }
            
            path = [UIBezierPath bezierPath];
            path.lineWidth = 5.0;
            path.lineCapStyle = kCGLineCapRound;
            
            NSLog(@"should change color");
            curColor = segment.myColor;
            [curColor setStroke];
            [path moveToPoint:segment.firstPoint];
            
            continue;
            
        }
        
        
        if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {
            // If start/end point of line segment is the same (i.e. this is the first
            // point, then move to that point so that line is drawn starting from that
            // point
            //[segment.myColor setStroke];
            [path moveToPoint:segment.firstPoint];
            
            continue;
        }
        //[segment.myColor setStroke];
        // Draw a line from the previous line segment to the first point
        [path addLineToPoint:segment.firstPoint];
        // Draw a line from the first point to the second point
        [path addLineToPoint:segment.secondPoint];
        
    }
    [path stroke];
}

- (void)clear{
    [self.line removeAllObjects];
    [self setNeedsDisplay];
}


@end
