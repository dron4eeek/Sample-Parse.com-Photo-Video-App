//
//  PCLeftMenuViewController.m
//  Sample Parse.com Photo Video App
//
//  Created by Developer on 3/8/14.
//  Copyright (c) 2014 a.molchanovskiy. All rights reserved.
//

#import "PCLeftMenuViewController.h"
#import <NZCircularImageView.h>

@interface PCLeftMenuViewController ()

@property (weak, nonatomic) IBOutlet NZCircularImageView *imgViewUser;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;

@end

@implementation PCLeftMenuViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
  PFUser *user = [PFUser currentUser];
  self.lblUserName.text = user.username;
  
  PFQuery *query = [PFQuery queryWithClassName:@"Profile_Photos"];
  [query whereKey:@"user" equalTo:user];
  [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
   {
     if (objects.count > 0)
     {
       PFObject *eachObject = [objects objectAtIndex:0];
       PFFile *theImage = [eachObject objectForKey:@"user_photo"];
       NSData *imageData = [theImage getData];
       UIImage *image = [UIImage imageWithData:imageData];
       [self.imgViewUser setImage:image];
     }
     else
     {
       self.imgViewUser.image = [UIImage imageNamed:@"user_image_placeholder"];
     }
   }];
}


- (IBAction)btnLogOutButtonTAp:(UIButton *)sender
{
  [PFUser logOut];
  UIStoryboard *storyboard = DELEGATE.window.rootViewController.storyboard;
  UIViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"loginController"];
  DELEGATE.window.rootViewController = rootViewController;
  [DELEGATE.window makeKeyAndVisible];
}

@end
