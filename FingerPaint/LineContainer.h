//
//  LineContainer.h
//  FingerPaint
//
//  Created by Spencer Symington on 2019-01-18.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

@import UIKit;
#import "LineSegment.h"

NS_ASSUME_NONNULL_BEGIN

@interface LineContainer : NSObject

@property (nonatomic) NSMutableArray<LineSegment *> *line;

@property (strong , nonatomic) UIColor *myColor;

-(instancetype)initWithColor:(UIColor*)color;
-(void)addSegment:(LineSegment*)segment;
-(void)drawAllSegments;

@end

NS_ASSUME_NONNULL_END
