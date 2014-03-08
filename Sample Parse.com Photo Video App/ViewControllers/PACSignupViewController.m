
#import "PACSignupViewController.h"

@interface PACSignupViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailEntry;
@property (weak, nonatomic) IBOutlet UITextField *usernameEntry;
@property (weak, nonatomic) IBOutlet UITextField *passwordEntry;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation PACSignupViewController

@synthesize usernameEntry, emailEntry, passwordEntry, activityIndicator;

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
  
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self
                                 action:@selector(dismissKeyboard)];
  [self.view addGestureRecognizer:tap];
  
  [usernameEntry setDelegate:self];
  [passwordEntry setDelegate:self];
  [emailEntry setDelegate:self];
}

- (IBAction)didTapSignup:(id)sender
{
  NSString *user = [usernameEntry text];
  NSString *pass = [passwordEntry text];
  NSString *email = [emailEntry text];
  
  if ([user length] < 4 || [pass length] < 4)
  {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Username and Password must both be at least 4 characters long." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alert show];
  } else if ([email length] < 8)
  {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Please enter your email address." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alert show];
  }
  else
  {
    [activityIndicator startAnimating];
    
    PFUser *newUser = [PFUser user];
    newUser.username = user;
    newUser.password = pass;
    newUser.email = email;
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
       [activityIndicator stopAnimating];
       if (error)
       {
         NSString *errorString = [[error userInfo] objectForKey:@"error"];
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
         [alert show];
       }
       else
       {
         UIStoryboard *storyboard = DELEGATE.window.rootViewController.storyboard;
         UIViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"slideController"];
         DELEGATE.window.rootViewController = rootViewController;
         [DELEGATE.window makeKeyAndVisible];
       }
     }];
  }
}

- (void)didTapBack:(id)sender
{
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissKeyboard
{
  [usernameEntry resignFirstResponder];
  [passwordEntry resignFirstResponder];
  [emailEntry resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
}

@end
