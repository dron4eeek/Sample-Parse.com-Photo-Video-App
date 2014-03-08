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
{
  int b;
  NSMutableArray *allImages;
}
@property (nonatomic, strong) CTAssetsPickerController *picker;
@property (nonatomic, strong) NSMutableArray *assets;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

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
      
      PFACL *photoACL = [PFACL ACLWithUser:[PFUser currentUser]];
      [photoACL setPublicReadAccess:YES];
      userPhoto.ACL = photoACL;
      
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
//  PFUser *user = [PFUser currentUser];
//  [query whereKey:@"user" equalTo:user];
  [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
  {
    NSMutableArray *newObjectIDArray = [NSMutableArray array];
    if (objects.count > 0) {
      for (PFObject *eachObject in objects)
      {
        [newObjectIDArray addObject:eachObject];
      }
      NSLog(@"%lu", (unsigned long)objects.count);
      [self setUpImages:newObjectIDArray];
    }
  }];
}

- (void)setUpImages:(NSArray *)images
{
  dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  dispatch_async(queue, ^{
    NSMutableArray *imageDataArray = [NSMutableArray array];
    // Iterate over all images and get the data from the PFFile
    for (int i = 0; i < images.count; i++) {
      PFObject *eachObject = [images objectAtIndex:i];
      PFFile *theImage = [eachObject objectForKey:@"photo"];
      NSString *url = theImage.url;
      NSLog(@"%@", url);
      NSData *imageData = [theImage getData];
      UIImage *image = [UIImage imageWithData:imageData];
      [imageDataArray addObject:image];
    }
       allImages = [imageDataArray mutableCopy];
  });
}

- (NSArray *)indexPathOfNewlyAddedAssets:(NSArray *)assets
{
	NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
	
	for (NSUInteger i = self.assets.count; i < self.assets.count + assets.count ; i++)
		[indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
	
	return indexPaths;
}

- (IBAction)down:(id)sender
{
  [self downloadAllImages];
}


- (IBAction)next:(id)sender
{
  self.imageView.image = [allImages objectAtIndex:b];
  b++;
}


@end
