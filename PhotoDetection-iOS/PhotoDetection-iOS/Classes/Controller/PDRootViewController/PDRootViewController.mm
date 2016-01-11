//
//  PDRootViewController.m
//  PhotoDetection-iOS
//
//  Created by Cris Uy on 10/01/2016.
//  Copyright © 2016 Alvin Cris Uy. All rights reserved.
//

#import "PDRootViewController.h"
#import "PDCameraViewController.h"

static PDRootViewController *_sharedController = nil;

@interface PDRootViewController () {
    PDCameraViewController *_cameraViewController;
}

// Transition
- (void)hiddenAllPage;

// Back Button
- (IBAction)backButtonAction:(id)sender;

@end

@implementation PDRootViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    
    _sharedController = self;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"Size: %f %f %f %f",
          self.view.frame.size.width,
          self.view.frame.size.height,
          self.view.frame.origin.x,
          self.view.frame.origin.y);
    
    NSLog(@"Bounds: %f %f %f %f",
          self.view.bounds.size.width,
          self.view.bounds.size.height,
          self.view.bounds.origin.x,
          self.view.bounds.origin.y);
    
    [self transitionCamera];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Back Button

- (IBAction)backButtonAction:(id)sender {
    [self popTransitionAnimated:YES];
}

#pragma mark - Transitions

- (void)transitionCamera {
    [self hiddenAllPage];
    
    [self transition:self.cameraViewController animated:NO];
}


- (void)hiddenAllPage {
    if (self.contentNavigationController) {
        [self.contentNavigationController popToRootViewControllerAnimated:NO];
    }
    
    NSArray* views = [self.contentView subviews];
    for (UIView* view in views) {
        [view removeFromSuperview];
    }
}

- (void)transition:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.contentNavigationController != nil) {
        self.contentNavigationController = nil;
    }
    
    self.contentNavigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self.contentNavigationController.view setFrame:self.contentView.bounds];
    
    self.backButtonView.alpha = 0;
    
    viewController.view.alpha = 1;
    
    CATransition* animation;
    animation      = [CATransition animation];
    animation.type = kCATransitionFade;
    {
        [self.contentView addSubview:self.contentNavigationController.view];
    }
    
    if (animated) {
        [self.contentView.layer addAnimation:animation forKey:nil];
    }
    
    [self.contentNavigationController setNavigationBarHidden:YES animated:NO];
    [self.contentNavigationController viewDidAppear:YES];
}

- (void)pushTransition:(UIViewController *)viewController animated:(BOOL)animated {
    CATransition* animation;
    animation      = [CATransition animation];
    animation.type = kCATransitionFade;
    {
        self.backButtonView.alpha = 1;
    }
    
    if (animated) {
        [self.backButtonView.layer addAnimation:animation forKey:nil];
    }
    
    viewController.view.frame = self.contentView.bounds;
    
    [self.contentNavigationController pushViewController:viewController animated:animated];
}

- (void)popTransitionAnimated:(BOOL)animated {
    [self.contentNavigationController popViewControllerAnimated:animated];
    
    if ([[self.contentNavigationController viewControllers] count] == 1) {
        CATransition* animation;
        animation      = [CATransition animation];
        animation.type = kCATransitionFade;
        {
            self.backButtonView.alpha = 0;
        }
        
        if (animated) {
            [self.backButtonView.layer addAnimation:animation forKey:nil];
        }
    }
}

#pragma mark - Transfer

- (void)transferCameraViewController:(id)sender {
    [self pushTransition:self.cameraViewController animated:YES];
}

- (PDCameraViewController *)cameraViewController {
    if (!_cameraViewController) {
        _cameraViewController = [[PDCameraViewController alloc] init];
        _cameraViewController.view.frame = self.contentView.bounds;
    }
    
    return _cameraViewController;
}

#pragma mark - Singleton

+ (PDRootViewController *)sharedController {
    
    @synchronized(self) {
        if (_sharedController == nil) {
            _sharedController = [[self alloc] init];
        }
    }
    
    return _sharedController;
}

@end
