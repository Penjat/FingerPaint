//
//  LineSegment.h
//  FingerPaint
//
//  Created by Spencer Symington on 2019-01-18.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface LineSegment : NSObject

@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint secondPoint;

- (instancetype)initWithFirstPoint:(CGPoint)first
                       secondPoint:(CGPoint)second;

@end

NS_ASSUME_NONNULL_END
