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
    float lineWidth; //繪圖筆寬度
    UIColor *lineColor; //繪圖筆顏色
}
@end

@implementation DrawingImageView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self defaultInit];
}

- (void)defaultInit{
    [self setUserInteractionEnabled:YES];
    isMoving = NO;
    lineWidth = 4;
    lineColor = [UIColor redColor];
    mLinePath = [[UIBezierPath alloc] init];
    mLineShapeLayer = [[CAShapeLayer alloc] init];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"touchesEnded");
    isMoving = NO;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    NSLog(@"touchesMoved");
    CGPoint movePen = [[touches anyObject] locationInView:self];
    if (movePen.x <0 || movePen.y <0) {
        return;
    }
    
    if (movePen.x > self.frame.size.width || movePen.y > self.frame.size.height) {
        return;
    }

    if (!isMoving) {
        isMoving = YES;
        [mLinePath moveToPoint:movePen];
    }else{
        [mLinePath addLineToPoint:movePen];
        mLineShapeLayer.lineWidth = lineWidth;
        mLineShapeLayer.strokeColor = lineColor.CGColor;
        mLineShapeLayer.path = mLinePath.CGPath;
        mLineShapeLayer.fillColor = nil;
    }
    
    [self.layer addSublayer:mLineShapeLayer];
}

@end
