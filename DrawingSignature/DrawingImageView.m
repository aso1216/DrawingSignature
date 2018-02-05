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

}
@end

@implementation DrawingImageView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUserInteractionEnabled:YES];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"touchesEnded");
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    NSLog(@"touchesMoved");
}

@end
