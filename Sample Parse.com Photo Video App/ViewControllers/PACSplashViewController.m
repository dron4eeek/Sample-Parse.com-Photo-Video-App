

#import "PACSplashViewController.h"

@interface PACSplashViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UIButton *btnWithOutLogin;

@end

@implementation PACSplashViewController

@synthesize activityIndicator, loginButton, signupButton;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.btnWithOutLogin.layer.cornerRadius = 7;
  self.btnWithOutLogin.clipsToBounds = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
//  [self checkStatus];
}

- (void)checkStatus
{
  [activityIndicator startAnimating];
  [loginButton setHidden:YES];
  [signupButton setHidden:YES];
  
  if ([PFUser currentUser])
  {
    UIStoryboard *storyboard = DELEGATE.window.rootViewController.storyboard;
    UIViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"slideController"];
    DELEGATE.window.rootViewController = rootViewController;
    [DELEGATE.window makeKeyAndVisible];
  }
  else
  {
    [activityIndicator stopAnimating];
    [loginButton setHidden:NO];
    [signupButton setHidden:NO];
  }
}


- (IBAction)didTapLogin:(id)sender
{
  
}

- (IBAction)didTapSignup:(id)sender
{

}

- (IBAction)didTapWithOutLogin:(id)sender
{
  [self dismissViewControllerAnimated:YES completion:^{
    
  }];
}

@end
