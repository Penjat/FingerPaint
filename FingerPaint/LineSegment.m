//
//  LineSegment.m
//  FingerPaint
//
//  Created by Spencer Symington on 2019-01-18.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "LineSegment.h"

@implementation LineSegment
- (instancetype)initWithFirstPoint:(CGPoint)first
                       secondPoint:(CGPoint)second{
    
    
    if (self = [super init]) {
        _firstPoint = first;
        _secondPoint = second;
        
    }
    return self;
}
@end
