//
//  AppDelegate.m
//  AppleTvTry
//
//  Created by Tibi Kolozsi on 09/08/14.
//  Copyright (c) 2014 tibikolozsi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleScreenDidConnectNotification:) name:UIScreenDidConnectNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleScreenDidDisconnectNotification:) name:UIScreenDidDisconnectNotification object:nil];
    return YES;
}

- (void)handleScreenDidConnectNotification:(NSNotification*)aNotification
{
    NSLog(@"Screen did connect");
    UIScreen *newScreen = [aNotification object];
    CGRect screenBounds = newScreen.bounds;
    
    if (!self.externalWindow)
    {
        self.externalWindow = [[UIWindow alloc] initWithFrame:screenBounds];
        self.externalWindow.screen = newScreen;
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        self.externalViewController = [storyboard instantiateViewControllerWithIdentifier:@"ExternalViewController"];
        self.externalViewController;
        self.externalWindow.rootViewController = self.externalViewController;
        self.externalWindow.hidden = NO;
        // Set the initial UI for the window.
    }
}

- (void)handleScreenDidDisconnectNotification:(NSNotification*)aNotification
{
     NSLog(@"Screen did disconnect");
    if (self.externalWindow)
    {
        // Hide and then delete the window.
        self.externalWindow.hidden = YES;
        self.externalWindow = nil;
        
    }
    
}

@end
