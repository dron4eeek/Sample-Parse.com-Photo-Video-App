#import <UIKit/UIKit.h>

@interface UIView(Attach)

- (void)attachBelow:(UIView *)view distance:(CGFloat)distance;
- (void)attachAfter:(UIView *)view distance:(CGFloat)distance;
- (void)attachToRight:(UIView*)rightView withSpace:(CGFloat)space;

@end
