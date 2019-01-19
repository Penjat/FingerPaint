//
//  PaintView.m
//  FingerPaint
//
//  Created by Spencer Symington on 2019-01-18.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "PaintView.h"
#import "LineSegment.h"
#import "LineContainer.h"

@interface PaintView()

@property (nonatomic) NSMutableArray<LineContainer *> *lines;
@property (nonatomic) NSMutableArray<LineContainer *> *redoList;

@property (nonatomic) LineContainer *curLineContainer;

@end

@implementation PaintView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _lines = [[NSMutableArray alloc]init];
        _redoList = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event{
    
    
    UIColor *curColor = [UIColor colorWithRed:self.redValue green:self.greenValue blue:self.blueValue alpha:1.0];
    
    LineContainer *lineContainer = [[LineContainer alloc]initWithColor:curColor];
    _curLineContainer = lineContainer;
    [self.lines addObject:lineContainer];
    
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    // First line segment is from the initial touch point to the initial touch point, so
    // basically a point
    
    
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first
                                                       secondPoint:first];
    //add segment to line
    [self.curLineContainer addSegment:segment];
    
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
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first
                                                                         secondPoint:second];
    [self.curLineContainer addSegment:segment];
    
    // Tell the system that we need to be redrawn, so the system will call drawRect: before
    // the end of the current event loop
    [self setNeedsDisplay];
}

    
- (void)drawRect:(CGRect)rect
{
    NSLog(@"there are %li",self.lines.count);
    for (LineContainer *lineContainer in self.lines) {
        [self drawAllSegments: lineContainer];
    }
    
    
}


- (void)clear{
    [self.lines removeAllObjects];
    [self setNeedsDisplay];
}

-(void)drawAllSegments:(LineContainer*)lineContainer{
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    UIColor *gray = lineContainer.myColor;
    [gray setStroke];
    
    // Loop through all elements in the segment array and draw each line
    for (LineSegment *segment in lineContainer.line) {
        if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {
            // If start/end point of line segment is the same (i.e. this is the first
            // point, then move to that point so that line is drawn starting from that
            // point
            [path moveToPoint:segment.firstPoint];
            continue;
        }
        // Draw a line from the previous line segment to the first point
        [path addLineToPoint:segment.firstPoint];
        // Draw a line from the first point to the second point
        [path addLineToPoint:segment.secondPoint];
    }
    [path stroke];
}

-(void)undo{
    if(self.lines.count == 0){
        return;
    }
    [self.redoList addObject:[self.lines lastObject]];
    [self.lines removeLastObject];
    [self setNeedsDisplay];
}
-(void)redo{
    if(self.redoList.count == 0){
        return;
    }
    [self.lines addObject:[self.redoList lastObject]];
    [self.redoList removeLastObject];
    [self setNeedsDisplay];
}

@end
