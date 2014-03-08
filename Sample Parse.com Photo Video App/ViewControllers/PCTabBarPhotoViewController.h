//
//  PCTabBarPhotoViewController.h
//  Sample Parse.com Photo Video App
//
//  Created by Developer on 3/8/14.
//  Copyright (c) 2014 a.molchanovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabbarControllerDelegate <NSObject>

- (void)cameraButtonDidTap:(id)sender;

@end

@interface PCTabBarPhotoViewController : UITabBarController

-(UIViewController*) viewControllerWithTabTitle:(NSString*) title image:(UIImage*)image;

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage;

@property (nonatomic, assign) id <TabbarControllerDelegate> cameraButtonDelegate;

@end
