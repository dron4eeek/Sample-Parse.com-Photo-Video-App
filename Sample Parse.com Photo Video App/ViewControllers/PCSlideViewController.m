//
//  PCSlideViewController.m
//  Sample Parse.com Photo Video App
//
//  Created by Developer on 3/8/14.
//  Copyright (c) 2014 a.molchanovskiy. All rights reserved.
//

#import "PCSlideViewController.h"
#import "PCLeftMenuViewController.h"
#import "PCFirstViewController.h"
#import "PCSecondViewController.h"

@interface PCSlideViewController () <RESideMenuDelegate>

@end

@implementation PCSlideViewController


- (void)awakeFromNib
{
  self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
  self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
  self.delegate = (PCSlideViewController *)self.menuViewController;
}

@end
