//
//  AppDelegate.h
//  AppleTvTry
//
//  Created by Tibi Kolozsi on 09/08/14.
//  Copyright (c) 2014 tibikolozsi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExternalViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWindow *externalWindow;
@property (nonatomic) ExternalViewController* externalViewController;

@end

