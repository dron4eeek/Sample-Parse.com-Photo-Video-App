#import <UIKit/UIKit.h>

@interface CRAlertHelper : NSObject

+ (void) alert:(NSString *)text title:(NSString *)title;
+ (void) alert:(NSString *)text title:(NSString *)title delegate:(id)sender
 cancellButton:(NSString *)cancell successButton:(NSString *)theSuccessButton;
+ (void) alert:(NSString *)text title:(NSString *)title tag:(NSInteger)alertTag delegate:(id)sender
 cancellButton:(NSString *)cancell successButton:(NSString *)theSuccessButton;

@end
