//
//  PDRootViewController.h
//  PhotoDetection-iOS
//
//  Created by Cris Uy on 10/01/2016.
//  Copyright © 2016 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDCameraViewController;

@interface PDRootViewController : UIViewController

// Rootview UIViews
@property (nonatomic, retain) IBOutlet UIView *navigationView;
@property (nonatomic, retain) IBOutlet UIView *contentView;

// Navigation Controller - Navigate Pages
@property (nonatomic, retain) UINavigationController *contentNavigationController;

// Back Button
@property (nonatomic, retain) IBOutlet UIView *backButtonView;
@property (nonatomic, retain) IBOutlet UIButton *backButton;

// Transitions
- (void)transitionCamera;

- (void)transition:(UIViewController *)viewController animated:(BOOL)animated;
- (void)popTransitionAnimated:(BOOL)animated;
- (void)pushTransition:(UIViewController *)viewController animated:(BOOL)animated;

// Transfer
- (void)transferCameraViewController:(id)sender;

- (PDCameraViewController *)cameraViewController;

// Singleton
+ (PDRootViewController *)sharedController;

@end
