//
//  FactoryHelper.m
//  Pack
//
//  Created by applegod on 10.01.14.
//  Copyright (c) 2014 Pack LLC. All rights reserved.
//

#import "FactoryHelper.h"
#import "PACSplashViewController.h"
#import "PCTabBarPhotoViewController.h"
#import "PCSlideViewController.h"

@interface FactoryHelper ()


@end

@implementation FactoryHelper

+ (FactoryHelper*)sharedClient
{
	static FactoryHelper *_sharedClient = nil;
	static dispatch_once_t onceToken;
	dispatch_once( &onceToken, ^
                  {
                      _sharedClient = [FactoryHelper new];
                  });
	
	return _sharedClient;
}

- (void)presentLoginViewController
{
  UIStoryboard *storyboard = DELEGATE.window.rootViewController.storyboard;
  UIViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"loginController"];
  
  PCSlideViewController * tab = (PCSlideViewController*)DELEGATE.window.rootViewController;
  PCTabBarPhotoViewController * cnt = (PCTabBarPhotoViewController*)tab.contentViewController;
  [cnt presentViewController:rootViewController animated:YES completion:nil];
}

@end
