//
//  PCPhotoUploadViewController.m
//  Sample Parse.com Photo Video App
//
//  Created by Developer on 3/7/14.
//  Copyright (c) 2014 a.molchanovskiy. All rights reserved.
//

#import "PCPhotoUploadViewController.h"
#import <CTAssetsPickerController.h>
#import "MBProgressHUD.h"
#include <stdlib.h>

@interface PCPhotoUploadViewController () <CTAssetsPickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) CTAssetsPickerController *picker;
@property (nonatomic, strong) NSMutableArray *assets;

@end

@implementation PCPhotoUploadViewController


- (void)viewDidLoad
{
  [super viewDidLoad];
  self.assets = [NSMutableArray new];
  self.picker = [[CTAssetsPickerController alloc] init];
  self.picker.delegate = self;
  self.picker.assetsFilter = [ALAssetsFilter allPhotos];
}


- (IBAction)didSelectPhotoButtonTap:(id)sender
{
  [self presentViewController:self.picker animated:YES completion:nil];
}

#pragma mark - Assets Picker Delegate

- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
	[self saveMediaToPostCreationArray:assets];
	[self.navigationController dismissViewControllerAnimated:NO completion:^{
	}];
}

- (void)saveMediaToPostCreationArray:(NSArray*)assets
{
	[self.assets addObjectsFromArray:assets];
	NSLog(@"Info: %@", self.assets);
	for (ALAsset * asset in self.assets)
	{
		NSLog(@"asset url = %@", [[asset defaultRepresentation] url]);
		ALAssetRepresentation *rep = [asset defaultRepresentation];
		CGImageRef iref = [rep fullResolutionImage];
		if (iref)
    {
			UIImage * image = [UIImage imageWithCGImage:iref];
       NSData *imageData = UIImageJPEGRepresentation(image, 4.0);
      [self uploadImage:imageData];
    }
	}
}

- (void)uploadImage:(NSData*)imageData
{
  PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
  
  //HUD creation here (see example for code)
  
  // Save PFFile
  [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    if (!error) {
      // Hide old HUD, show completed HUD (see example for code)
      
      // Create a PFObject around a PFFile and associate it with the current user
      PFObject *userPhoto = [PFObject objectWithClassName:@"Photos"];
      [userPhoto setObject:imageFile forKey:@"photo"];
      
      // Set the access control list to current user for security purposes
      userPhoto.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
      
      PFUser *user = [PFUser currentUser];
      [userPhoto setObject:user forKey:@"user"];
      
      [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
//          [self refresh:nil];
        }
        else{
          // Log details of the failure
          NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
      }];
    }
    else{
//      [HUD hide:YES];
      // Log details of the failure
      NSLog(@"Error: %@ %@", error, [error userInfo]);
    }
  } progressBlock:^(int percentDone) {
    // Update your progress spinner here. percentDone will be between 0 and 100.
//    HUD.progress = (float)percentDone/100;
  }];
}

- (void)downloadAllImages
{
  PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
  PFUser *user = [PFUser currentUser];
  [query whereKey:@"user" equalTo:user];
  [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
  {
    // If there are photos, we start extracting the data
    // Save a list of object IDs while extracting this data
    
    NSMutableArray *newObjectIDArray = [NSMutableArray array];
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (objects.count > 0) {
      for (PFObject *eachObject in objects)
      {
        [newObjectIDArray addObject:[eachObject objectId]];
      }
    }
  }];
}

- (NSArray *)indexPathOfNewlyAddedAssets:(NSArray *)assets
{
	NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
	
	for (NSUInteger i = self.assets.count; i < self.assets.count + assets.count ; i++)
		[indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
	
	return indexPaths;
}

@end
