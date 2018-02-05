ViewController.m

@interface ViewController () @property (weak, nonatomic) IBOutlet DrawingImageView *drawingIV; @end

清除繪圖層 [self.drawingIV ClearDrawing];

取圖繪圖層UIImage [self.drawingIV GetLayerImage];

設定繪圖畫筆 self.drawingIV.lineWidth = 4; self.drawingIV.lineColor = [UIColor blueColor];
