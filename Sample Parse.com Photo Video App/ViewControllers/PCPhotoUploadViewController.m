//
//  PCPhotoUploadViewController.m
//  Sample Parse.com Photo Video App
//
//  Created by Developer on 3/7/14.
//  Copyright (c) 2014 a.molchanovskiy. All rights reserved.
//

#import "PCPhotoUploadViewController.h"
#import <CTAssetsPickerController.h>

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
    }
	}
}

- (NSArray *)indexPathOfNewlyAddedAssets:(NSArray *)assets
{
	NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
	
	for (NSUInteger i = self.assets.count; i < self.assets.count + assets.count ; i++)
		[indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
	
	return indexPaths;
}

@end
