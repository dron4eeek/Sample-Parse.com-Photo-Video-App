//
//  UITableViewCell+Helpers.m
//  Pack
//
//  Created by Aleksei Kaut on 9/1/13.
//
//

#import "UITableViewCell+Helpers.h"

@implementation UITableViewCell(Helpers)

- (NSIndexPath*)getIndexPath
{
  if([self.superview isKindOfClass:[UITableView class]])
  {
    UITableView* tableView = (UITableView *)self.superview;
    NSIndexPath* indexPath = [tableView indexPathForCell:self];
    return indexPath;
  }
  else if([self.superview.superview isKindOfClass:[UITableView class]])
  {
    UITableView* tableView = (UITableView *)self.superview.superview;
    NSIndexPath* indexPath = [tableView indexPathForCell:self];
    return indexPath;
  }
  return nil;
}

@end
