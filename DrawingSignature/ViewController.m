//
//  ViewController.m
//  DrawingSignature
//
//  Created by 任昌 陳 on 2018/2/5.
//  Copyright © 2018年 任昌 陳. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>
#import "DrawingImageView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawingImageView *drawingIV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)defaultInit{

}

- (IBAction)actClear:(id)sender {
    [self.drawingIV ClearDrawing];
}

- (IBAction)actSaveToAlbum:(id)sender {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch (status) {
        case PHAuthorizationStatusNotDetermined:
        {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus statusResult) {
                if (statusResult == PHAuthorizationStatusDenied) {
                    NSLog(@"PHAuthorizationStatusDenied");
                }else if (statusResult == PHAuthorizationStatusAuthorized){
                    UIImageWriteToSavedPhotosAlbum([self.drawingIV GetLayerImage], self, nil, nil);
                    NSLog(@"PHAuthorizationStatusAuthorized");
                }
            }];
        }
            break;
        case PHAuthorizationStatusRestricted:
        {
            NSLog(@"PHAuthorizationStatusRestricted");
        }
            break;
        case PHAuthorizationStatusDenied:
        {
            NSLog(@"PHAuthorizationStatusDenied");
        }
            break;
        case PHAuthorizationStatusAuthorized:
        {
            UIImageWriteToSavedPhotosAlbum([self.drawingIV GetLayerImage], self, nil, nil);
            NSLog(@"PHAuthorizationStatusAuthorized");
        }
            break;
    }
}

@end
