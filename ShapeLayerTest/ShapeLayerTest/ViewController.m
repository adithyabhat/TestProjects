//
//  ViewController.m
//  ShapeLayerTest
//
//  Created by Adithya H Bhat on 01/07/14.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
            
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CAShapeLayer *layerWithPath = [CAShapeLayer layer];
    layerWithPath.frame = self.imageView.bounds;
    
    UIBezierPath *thePath = [UIBezierPath bezierPath];
    [thePath moveToPoint:CGPointMake(0, CGRectGetHeight(self.imageView.frame)/2)];
    [thePath addLineToPoint:CGPointMake(320.0f, CGRectGetHeight(self.imageView.frame)/2)];
    layerWithPath.path = thePath.CGPath;
    layerWithPath.strokeColor = [UIColor blackColor].CGColor;
    
    self.imageView.layer.mask = layerWithPath;
    
    [self animate];
}

- (void)animate
{
    __block CGRect imageRect = self.imageView.frame;
    imageRect.size.width = 0;
    self.imageView.frame = imageRect;
    
    [UIView animateWithDuration:1.0f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         imageRect.size.width = 320.0f;
                         self.imageView.frame = imageRect;
                     } completion:^(BOOL finished) {
                         [self animate];
                     }];
}

@end
