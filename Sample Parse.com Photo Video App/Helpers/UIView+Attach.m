#import "UIView+Attach.h"

@implementation UIView(Attach)

- (void)attachBelow:(UIView *)view distance:(CGFloat)distance
{
  CGFloat new_y;
	if ([view isHidden])
	{
		new_y = view.frame.origin.y;
	}
	else
	{
		new_y = view.frame.origin.y + view.frame.size.height + distance;
	}
  self.frame = CGRectMake(self.frame.origin.x,
                          new_y,
                          self.frame.size.width,
                          self.frame.size.height);
}

- (void)attachAfter:(UIView *)view distance:(CGFloat)distance
{
  CGFloat new_x = view.frame.origin.x + view.frame.size.width + distance;
  self.frame = CGRectMake(new_x,
                          self.frame.origin.y,
                          self.frame.size.width,
                          self.frame.size.height);
}

- (void)attachToRight:(UIView*)rightView withSpace:(CGFloat)space
{
  if ([rightView isHidden]) {
    CGRect frameRight = rightView.frame;
    CGRect curentView = self.frame;
    curentView.origin.x = frameRight.origin.x;
    self.frame = curentView;
  } else {
    CGRect frameRight = rightView.frame;
    CGRect curentView = self.frame;
    curentView.origin.x = frameRight.origin.x - curentView.size.width - space;
    self.frame = curentView;
  }
}

@end
