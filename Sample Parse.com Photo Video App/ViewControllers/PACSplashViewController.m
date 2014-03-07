

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
  [self checkStatus];
}

- (void)checkStatus
{
  NSLog(@"Splash - checkStatus");
  [activityIndicator startAnimating];
  [loginButton setHidden:YES];
  [signupButton setHidden:YES];
  
  if ([PFUser currentUser])
  {
    [self performSegueWithIdentifier:@"splashToMain" sender:self];
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
  
}

@end
