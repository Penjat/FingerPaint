//
//  PaintViewController.m
//  FingerPaint
//
//  Created by Spencer Symington on 2019-01-18.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "PaintViewController.h"
#import "PaintView.h"

@interface PaintViewController ()

@property (weak, nonatomic) IBOutlet PaintView *paintView;

@property (weak, nonatomic) IBOutlet UIView *colorPreview;


@end

@implementation PaintViewController
- (IBAction)redSlider:(UISlider*)sender {
    self.paintView.redValue = sender.value;
    [self updateColorPreview ];
}
- (IBAction)blueSlider:(UISlider*)sender {
    self.paintView.blueValue = sender.value;
    [self updateColorPreview ];
}
- (IBAction)greenSlider:(UISlider*)sender {
    self.paintView.greenValue = sender.value;
    [self updateColorPreview ];
}
-(void)updateColorPreview{
    self.colorPreview.backgroundColor = [UIColor colorWithRed:self.paintView.redValue green:self.paintView.greenValue blue:self.paintView.blueValue alpha:1.0];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
