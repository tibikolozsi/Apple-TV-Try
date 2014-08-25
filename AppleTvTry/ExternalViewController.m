//
//  ExternalViewController.m
//  AppleTvTry
//
//  Created by Tibi Kolozsi on 09/08/14.
//  Copyright (c) 2014 tibikolozsi. All rights reserved.
//

#import "ExternalViewController.h"

@interface ExternalViewController ()

@end

@implementation ExternalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shouldStartPresentation) name:@"shouldStartPresentation" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shouldFinishPresentation) name:@"shouldFinishPresentation" object:nil];
    // Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:@"shouldStartPresentation"];
    [[NSNotificationCenter defaultCenter] removeObserver:@"shouldFinishPresentation"];
}

- (void)shouldStartPresentation
{
    self.view.backgroundColor = [UIColor redColor];
}

- (void)shouldFinishPresentation
{
    self.view.backgroundColor = [UIColor blackColor];
}

@end
