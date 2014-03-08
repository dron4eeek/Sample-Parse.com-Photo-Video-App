//
//  PCFirstViewController.m
//  Sample Parse.com Photo Video App
//
//  Created by Developer on 3/8/14.
//  Copyright (c) 2014 a.molchanovskiy. All rights reserved.
//

#import "PCFirstViewController.h"
#import <RESideMenu.h>
#import <FRDLivelyButton.h>
#import <MHGallery.h>
//#import <MHOverViewController.h>
#import <MHGalleryCells.h>

@interface PCFirstViewController () <UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *galleryDataSource;
@end

@implementation TestCell
@end

@implementation PCFirstViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
  
  FRDLivelyButton *button = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0,0,36,28)];
  [button setStyle:kFRDLivelyButtonStyleHamburger animated:YES];
  [button addTarget:self action:@selector(leftMenuButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
  UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
  self.navigationItem.leftBarButtonItem = buttonItem;
  
  MHGalleryItem *youtube = [[MHGalleryItem alloc]initWithURL:@"http://www.youtube.com/watch?v=YSdJtNen-EA"
                                                 galleryType:MHGalleryTypeVideo];
  
  MHGalleryItem *vimeo0 = [[MHGalleryItem alloc]initWithURL:@"http://vimeo.com/35515926"
                                                galleryType:MHGalleryTypeVideo];
  MHGalleryItem *vimeo1 = [[MHGalleryItem alloc]initWithURL:@"http://vimeo.com/50006726"
                                                galleryType:MHGalleryTypeVideo];
  MHGalleryItem *vimeo3 = [[MHGalleryItem alloc]initWithURL:@"http://vimeo.com/66841007"
                                                galleryType:MHGalleryTypeVideo];
  
  MHGalleryItem *landschaft = [[MHGalleryItem alloc]initWithURL:@"http://alles-bilder.de/landschaften/HD%20Landschaftsbilder%20(47).jpg"
                                                    galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft1 = [[MHGalleryItem alloc]initWithURL:@"http://de.flash-screen.com/free-wallpaper/bezaubernde-landschaftsabbildung-hd/hd-bezaubernde-landschaftsder-tapete,1920x1200,56420.jpg"
                                                     galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft2 = [[MHGalleryItem alloc]initWithURL:@"http://alles-bilder.de/landschaften/HD%20Landschaftsbilder%20(64).jpg"
                                                     galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft3 = [[MHGalleryItem alloc]initWithURL:@"http://www.dirks-computerseite.de/wp-content/uploads/2013/06/purpleworld1.jpg"
                                                     galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft4 = [[MHGalleryItem alloc]initWithURL:@"http://alles-bilder.de/landschaften/HD%20Landschaftsbilder%20(42).jpg"
                                                     galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft5 = [[MHGalleryItem alloc]initWithURL:@"http://woxx.de/wp-content/uploads/sites/3/2013/02/8X2cWV3.jpg"
                                                     galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft6 = [[MHGalleryItem alloc]initWithURL:@"http://kwerfeldein.de/wp-content/uploads/2012/05/Sharpened-version.jpg"
                                                     galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft7 = [[MHGalleryItem alloc]initWithURL:@"http://eswalls.com/wp-content/uploads/2014/01/sunset-glow-trees-beautiful-scenery.jpg"
                                                     galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft8 = [[MHGalleryItem alloc]initWithURL:@"http://eswalls.com/wp-content/uploads/2014/01/beautiful_scenery_wallpaper_The_Eiffel_Tower_at_night_.jpg"
                                                     galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft9 = [[MHGalleryItem alloc]initWithURL:@"http://p1.pichost.me/i/40/1638707.jpg"
                                                     galleryType:MHGalleryTypeImage];
  
  MHGalleryItem *landschaft10 = [[MHGalleryItem alloc]initWithURL:@"http://4.bp.blogspot.com/-8O0ZkAgb6Bo/Ulf_80tUN6I/AAAAAAAAH34/I1L2lKjzE9M/s1600/Beautiful-Scenery-Wallpapers.jpg"
                                                      galleryType:MHGalleryTypeImage];
  
  
  NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"Awesome!!\nOr isn't it?"];
  
  [string setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} range:NSMakeRange(0, string.length)];
  [string setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:17]} range:NSMakeRange(0, 9)];
  
  landschaft10.attributedString = string;
  
  
  self.galleryDataSource = @[@[landschaft10,landschaft8,landschaft7,landschaft9,landschaft6,landschaft5,landschaft4,landschaft3,landschaft2,landschaft,landschaft1,landschaft10,landschaft8,landschaft7,landschaft9,landschaft6,landschaft5,landschaft4,landschaft3,landschaft2,landschaft,landschaft1,landschaft10,landschaft8,landschaft7,landschaft9,landschaft6,landschaft5,landschaft4,landschaft3,landschaft2,landschaft,landschaft1],
                             @[vimeo3,youtube,vimeo0,vimeo1,landschaft9,landschaft6,landschaft5,landschaft4,landschaft3,landschaft2,landschaft,landschaft1],
                             @[landschaft9,landschaft6,landschaft5,landschaft4,landschaft3,landschaft2,landschaft,landschaft1]
                             ];
  self.tableView.backgroundColor = [UIColor colorWithRed:0.83 green:0.84 blue:0.86 alpha:1];
  [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return self.galleryDataSource.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return [self.galleryDataSource[collectionView.tag] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 330;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *cellIdentifier = nil;
  cellIdentifier = @"TestCell";
  
  TestCell *cell = (TestCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  if (!cell){
    cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  cell.backView.layer.masksToBounds = NO;
  cell.backView.layer.shadowOffset = CGSizeMake(0, 0);
  cell.backView.layer.shadowRadius = 1.0;
  cell.backView.layer.shadowColor = [UIColor blackColor].CGColor;
  cell.backView.layer.shadowOpacity = 0.5;
  cell.backView.layer.shadowPath = [UIBezierPath bezierPathWithRect:cell.backView.bounds].CGPath;
  cell.backView.layer.cornerRadius = 2.0;
  
  UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
  layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25);
  layout.itemSize = CGSizeMake(270, 225);
  layout.minimumLineSpacing = 15;
  layout.minimumInteritemSpacing = 15;
  layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  cell.collectionView.collectionViewLayout = layout;
  
  [cell.collectionView registerClass:[MHGalleryOverViewCell class] forCellWithReuseIdentifier:@"MHGalleryOverViewCell"];
  
  cell.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
  
  [cell.collectionView setShowsHorizontalScrollIndicator:NO];
  [cell.collectionView setDelegate:self];
  [cell.collectionView setDataSource:self];
  [cell.collectionView setTag:indexPath.section];
  [cell.collectionView reloadData];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  return cell;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewCell *cell =nil;
  NSString *cellIdentifier = @"MHGalleryOverViewCell";
  cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
  NSIndexPath *indexPathNew = [NSIndexPath indexPathForRow:indexPath.row inSection:collectionView.tag];
  [self makeOverViewDetailCell:(MHGalleryOverViewCell*)cell atIndexPath:indexPathNew];
  
  return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  UIImageView *imageView = [(MHGalleryOverViewCell*)[collectionView cellForItemAtIndexPath:indexPath] thumbnail];
  
  NSArray *galleryData = self.galleryDataSource[collectionView.tag];
  
  
  MHGalleryController *gallery = [[MHGalleryController alloc]initWithPresentationStyle:MHGalleryPresentionStyleImageViewer];
  gallery.galleryItems = galleryData;
  gallery.presentingFromImageView = imageView;
  gallery.presentationIndex = indexPath.row;
  
  __block MHGalleryController *blockGallery = gallery;
  
  gallery.finishedCallback = ^(NSUInteger currentIndex,UIImage *image,MHTransitionDismissMHGallery *interactiveTransition){
    
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:currentIndex inSection:0];
    CGRect cellFrame  = [[collectionView collectionViewLayout] layoutAttributesForItemAtIndexPath:newIndexPath].frame;
    [collectionView scrollRectToVisible:cellFrame
                               animated:NO];
    
    dispatch_async(dispatch_get_main_queue(), ^{
      [collectionView reloadItemsAtIndexPaths:@[newIndexPath]];
      [collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
      
      MHGalleryOverViewCell *cell = (MHGalleryOverViewCell*)[collectionView cellForItemAtIndexPath:newIndexPath];
      
      [blockGallery dismissViewControllerAnimated:YES dismissImageView:cell.thumbnail completion:^{
        
        MPMoviePlayerController *player = interactiveTransition.moviePlayer;
        
        player.controlStyle = MPMovieControlStyleEmbedded;
        player.view.frame = cell.bounds;
        player.scalingMode = MPMovieScalingModeAspectFill;
        [cell.contentView addSubview:player.view];
      }];
    });
  };
  [self presentMHGalleryController:gallery animated:YES completion:nil];
  
  
}

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
  return YES;
}


- (void)makeOverViewDetailCell:(MHGalleryOverViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
  MHGalleryItem *item = self.galleryDataSource[indexPath.section][indexPath.row];
  [cell.thumbnail setContentMode:UIViewContentModeScaleAspectFill];
  
  cell.thumbnail.layer.shadowOffset = CGSizeMake(0, 0);
  cell.thumbnail.layer.shadowRadius = 1.0;
  cell.thumbnail.layer.shadowColor = [UIColor blackColor].CGColor;
  cell.thumbnail.layer.shadowOpacity = 0.5;
  cell.thumbnail.layer.shadowPath = [UIBezierPath bezierPathWithRect:cell.thumbnail.bounds].CGPath;
  cell.thumbnail.layer.cornerRadius = 2.0;
  
  cell.thumbnail.image = nil;
  if (item.galleryType == MHGalleryTypeImage)
  {
    [cell.thumbnail setImageWithURL:[NSURL URLWithString:item.urlString]];
  }else
  {
    [[MHGallerySharedManager sharedManager] startDownloadingThumbImage:item.urlString
                                                          successBlock:^(UIImage *image, NSUInteger videoDuration, NSError *error,NSString *newURL) {
                                                            cell.thumbnail.image = image;
                                                          }];
  }
}

- (void)leftMenuButtonDidTap:(id)sender
{
  [self.sideMenuViewController presentMenuViewController];
}
@end
