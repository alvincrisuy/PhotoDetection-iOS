//
//  PDCameraViewController.m
//  PhotoDetection-iOS
//
//  Created by Cris Uy on 10/01/2016.
//  Copyright © 2016 Alvin Cris Uy. All rights reserved.
//

#import "PDCameraViewController.h"


// not here - start
#define kNumTextures 2

namespace {
    const char* textureFilenames[] = {
        "human_1.png",
        "human_2.png",
    };
}
// not here - end

@interface PDCameraViewController ()

@end

@implementation PDCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
