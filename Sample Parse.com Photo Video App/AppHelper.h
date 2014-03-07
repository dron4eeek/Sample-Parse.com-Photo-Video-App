#import "PCAppDelegate.h"

#define DELEGATE ((PCAppDelegate*)[[UIApplication sharedApplication] delegate])
#define IS_IOS7_AND_LATER_DEVICE_VERSION [[[UIDevice currentDevice] systemVersion] floatValue] >= 7
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)

#define PARSE_CLIENT_ID @"6xwPf0C408ptkDshbML70cl4fwsiMg0RhOAaKCsI"
#define PARCE_APP_ID @"lkj3DKgFzlphFt0ycWlNHKglHXizcHBXGTt8pfkE"