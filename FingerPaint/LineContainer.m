//
//  LineContainer.m
//  FingerPaint
//
//  Created by Spencer Symington on 2019-01-18.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "LineContainer.h"

@implementation LineContainer

- (instancetype)initWithColor:(UIColor*) color{
    self = [super init];
    if (self) {
        
        _line = [[NSMutableArray alloc]init];
        _myColor = color;
        
    }
    return self;
}

-(void)addSegment:(LineSegment*)segment{
    [self.line addObject:segment];
    
    
}


    
    

@end
