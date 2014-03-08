#import "CRAlertHelper.h"

@implementation CRAlertHelper

+ (void) alert:(NSString *)text title:(NSString *)title
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title message: text delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
	[alert show];
}

+ (void) alert:(NSString *)text title:(NSString *)title delegate:(id)sender
 cancellButton:(NSString *)cancell successButton:(NSString *)theSuccessButton
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title message: text delegate: sender cancelButtonTitle: cancell otherButtonTitles: theSuccessButton, nil];
	[alert show];
}

+ (void) alert:(NSString *)text title:(NSString *)title tag:(NSInteger)alertTag delegate:(id)sender
 cancellButton:(NSString *)cancell successButton:(NSString *)theSuccessButton
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title message: text delegate: sender cancelButtonTitle: cancell otherButtonTitles: theSuccessButton, nil];
  alert.tag = alertTag;
	[alert show];
}

@end
