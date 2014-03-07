

#import "PACLoginViewController.h"

@interface PACLoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameEntry;
@property (weak, nonatomic) IBOutlet UITextField *passwordEntry;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation PACLoginViewController

@synthesize usernameEntry, passwordEntry, activityIndicator;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"Login";
  
  UIImage *backArrow = [UIImage imageNamed:@"backArrow"];
  UIImage *backArrowPressed = [UIImage imageNamed:@"backArrowPressed"];
  
  UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [backButton setImage:backArrow forState:UIControlStateNormal];
  [backButton setImage:backArrowPressed forState:UIControlStateSelected];
  
  backButton.frame = CGRectMake(2.0f, 2.0f, 40.0f, 40.0f);
  [backButton addTarget:self action:@selector(didTapBack:) forControlEvents:UIControlEventTouchUpInside];
  
  UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:backButton];
  
  self.navigationItem.leftBarButtonItem = back;
  
  [usernameEntry setDelegate:self];
  [passwordEntry setDelegate:self];
}

- (IBAction)didTapLogin:(id)sender
{
  NSString *user = [usernameEntry text];
  NSString *pass = [passwordEntry text];
  
  if ([user length] < 4 || [pass length] < 4)
  {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Username and Password must both be at least 4 characters long." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alert show];
  }
  else
  {
    [activityIndicator startAnimating];
    [PFUser logInWithUsernameInBackground:user password:pass block:^(PFUser *user, NSError *error)
     {
       [activityIndicator stopAnimating];
       if (user)
       {
         [self performSegueWithIdentifier:@"loginToMain" sender:self];
       } else {
         NSLog(@"%@",error);
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed." message:@"Invalid Username and/or Password." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
         [alert show];
       }
     }];
  }
}

- (void)didTapBack:(id)sender
{
  NSLog(@"Going back.");
  [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
}
@end
