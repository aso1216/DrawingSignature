//
//  DrawingImageView.h
//  DrawingSignature
//
//  Created by 任昌 陳 on 2018/2/5.
//  Copyright © 2018年 任昌 陳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingImageView : UIImageView

@property (nonatomic,assign) float lineWidth; //繪圖筆寬度
@property (nonatomic,strong) UIColor *lineColor; //繪圖筆顏色
- (void)ClearDrawing; //清除繪圖
- (UIImage *)GetLayerImage; //取得繪圖
@end
