
#import "PACMainViewController.h"

@interface PACMainViewController ()

@end

@implementation PACMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *backArrow = [UIImage imageNamed:@"logoutButton"];
    UIImage *backArrowPressed = [UIImage imageNamed:@"logoutButtonPressed"];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:backArrow forState:UIControlStateNormal];
    [backButton setImage:backArrowPressed forState:UIControlStateSelected];
    
    backButton.frame = CGRectMake(2.0f, 2.0f, 40.0f, 40.0f);
    [backButton addTarget:self action:@selector(didTapBack:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = back;
  
    self.title = @"You're In!";
}

- (void)didTapBack:(id)sender
{
    [PFUser logOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
