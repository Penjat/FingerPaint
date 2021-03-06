//
//  PaintView.h
//  FingerPaint
//
//  Created by Spencer Symington on 2019-01-18.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaintView : UIView

@property float redValue;
@property float blueValue;
@property float greenValue;

- (void)clear;

@end

NS_ASSUME_NONNULL_END
