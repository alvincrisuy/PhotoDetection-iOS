//
//  AppDelegate.h
//  PhotoDetection-iOS
//
//  Created by Cris Uy on 09/01/2016.
//  Copyright © 2016 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDRootViewController;

@interface PDAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow     *window;
@property (nonatomic, retain) PDRootViewController  *rootViewController;

@end

