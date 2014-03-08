#import "UILabel+dynamicSizeMe.h"

@implementation UILabel (dynamicSizeMe)

- (float)resizeToFit
{
  float height = [self expectedHeight];
  CGRect newFrame = [self frame];
  newFrame.size.height = height;
  [self setFrame:newFrame];
  return newFrame.origin.y + newFrame.size.height;
}

- (float)expectedHeight
{
  [self setNumberOfLines:0];
  [self setLineBreakMode:NSLineBreakByWordWrapping];
  
  CGSize expectedLabelSize = [self suggestedSizeForWidth:self.frame.size.width andHeight:FLT_MAX];
  return expectedLabelSize.height;
}

- (CGSize)suggestedSizeForWidth:(float)width andHeight:(float)height
{
	CGSize suggestedSize;
  if([self.text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
  {
    suggestedSize = [self.text length] > 0 ? [self.text boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size : CGSizeZero;
  }
  else
  {
    suggestedSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(width, height) lineBreakMode:self.lineBreakMode];
  }
	suggestedSize.width = ceilf(suggestedSize.width);
	suggestedSize.height = ceilf(suggestedSize.height);
	return suggestedSize;
}


@end
