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

    
- (void)drawRect:(CGRect)rect {
    
}


@end
