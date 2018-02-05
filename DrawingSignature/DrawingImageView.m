//
//  DrawingImageView.m
//  DrawingSignature
//
//  Created by 任昌 陳 on 2018/2/5.
//  Copyright © 2018年 任昌 陳. All rights reserved.
//

#import "DrawingImageView.h"

@interface DrawingImageView ()
{
    UIBezierPath *mLinePath; //繪圖貝茲曲線
    CAShapeLayer *mLineShapeLayer; //繪圖Layer
    CGPoint lastPoint; //最後移動位置
    BOOL isMoving; //是否正在移動中
}
@end

@implementation DrawingImageView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self defaultInit];
}

- (void)defaultInit{
    [self setUserInteractionEnabled:YES];
    self.lineWidth = 4;
    self.lineColor = [UIColor redColor];
    isMoving = NO;

    mLinePath = [[UIBezierPath alloc] init];
    mLineShapeLayer = [[CAShapeLayer alloc] init];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    isMoving = NO;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    CGPoint movePen = [[touches anyObject] locationInView:self];
    if (movePen.x <0 || movePen.y <0) {
        isMoving = NO;
        return;
    }
    
    if (movePen.x > self.frame.size.width || movePen.y > self.frame.size.height) {
        isMoving = NO;
        return;
    }

    if (!isMoving) {
        isMoving = YES;
        [mLinePath moveToPoint:movePen];
    }else{
        [mLinePath addLineToPoint:movePen];
        mLineShapeLayer.lineWidth = self.lineWidth;
        mLineShapeLayer.strokeColor = self.lineColor.CGColor;
        mLineShapeLayer.path = mLinePath.CGPath;
        mLineShapeLayer.fillColor = nil;
    }

    [self.layer addSublayer:mLineShapeLayer];
}

- (void)ClearDrawing{
    mLinePath = [[UIBezierPath alloc] init];
    mLineShapeLayer = [[CAShapeLayer alloc] init];
    for (CAShapeLayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
}

- (UIImage *)GetLayerImage{
    UIGraphicsBeginImageContextWithOptions(self.layer.frame.size, NO, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}
@end
