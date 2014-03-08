//
//  PCTabBarPhotoViewController.m
//  Sample Parse.com Photo Video App
//
//  Created by Developer on 3/8/14.
//  Copyright (c) 2014 a.molchanovskiy. All rights reserved.
//

#import "PCTabBarPhotoViewController.h"

@interface PCTabBarPhotoViewController ()

@end

@implementation PCTabBarPhotoViewController

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
	// Do any additional setup after loading the view.
  self.tabBar.barTintColor = [UIColor colorWithRed:(39/255.0) green:(38/255.0) blue:(38/255.0) alpha:1];
   [self addCenterButtonWithImage:[UIImage imageNamed:@"camera_middle"] highlightImage:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

-(UIViewController*) viewControllerWithTabTitle:(NSString*) title image:(UIImage*)image
{
  UIViewController* viewController = [[UIViewController alloc] init];
  viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
  return viewController;
}

// Create a custom UIButton and add it to the center of our tab bar
-(void)addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
  UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
  button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
  [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
  [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
  [button addTarget:self action:@selector(cameraButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
  
  CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
  if (heightDifference < 0)
    button.center = self.tabBar.center;
  else
  {
    CGPoint center = self.tabBar.center;
    center.y = center.y - heightDifference/2.0;
    button.center = center;
  }
  
  [self.view addSubview:button];
}

- (void)cameraButtonDidTap:(id)sender
{
  [self.cameraButtonDelegate cameraButtonDidTap:self];
}

@end
