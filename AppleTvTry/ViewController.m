//
//  ViewController.m
//  AppleTvTry
//
//  Created by Tibi Kolozsi on 09/08/14.
//  Copyright (c) 2014 tibikolozsi. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ExternalViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *presentationButton;
@property (nonatomic) BOOL started;

@end

@implementation ViewController

- (AppDelegate*)appdelegate
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.started = NO;
    // Do any additional setup after loading the view, typically from a nib.
    [self.label setText:@"iPad window"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textFieldValueChanged:(id)sender {

}
- (IBAction)textFieldEditingChanged:(id)sender {
    ExternalViewController* exVC = [self appdelegate].externalViewController;
    exVC.label.text = ((UITextField*)sender).text;
}
- (IBAction)startPresentationButtonTouched:(id)sender {
    if (self.started) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shouldFinishPresentation" object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shouldStartPresentation" object:nil];
    }
    self.started = !self.started;
}

@end
