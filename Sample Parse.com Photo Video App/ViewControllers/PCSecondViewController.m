//
//  PCSecondViewController.m
//  Sample Parse.com Photo Video App
//
//  Created by Developer on 3/8/14.
//  Copyright (c) 2014 a.molchanovskiy. All rights reserved.
//

#import "PCSecondViewController.h"

@interface PCSecondViewController () <TabbarControllerDelegate>

@end

@implementation PCSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  PCTabBarPhotoViewController * tabbar = (PCTabBarPhotoViewController*)self.tabBarController;
  tabbar.cameraButtonDelegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cameraButtonDidTap:(id)sender
{
  NSLog(@"sdsd");
}

@end
