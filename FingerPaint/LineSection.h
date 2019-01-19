//
//  LineSection.h
//  FingerPaint
//
//  Created by Spencer Symington on 2019-01-18.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LineSegment.h"

NS_ASSUME_NONNULL_BEGIN

@interface LineContainer : NSObject


@property (nonatomic) NSMutableArray<LineSegment *> *line;

@end

NS_ASSUME_NONNULL_END
