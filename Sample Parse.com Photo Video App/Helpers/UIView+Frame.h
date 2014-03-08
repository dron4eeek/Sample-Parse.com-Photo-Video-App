//
//  UIView+frame.h
//
//  Created by Evgeny Yagrushkin
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
-(void) setOrigin:(CGPoint)loc;
-(void) setX:(CGFloat)x;
-(void) setY:(CGFloat)y;
-(void) setSize:(CGSize)sz;
-(void) setWidth:(CGFloat)w;
-(void) setHeight:(CGFloat)h;
-(void) setCenterX:(CGFloat) x;
-(void) setCenterY:(CGFloat) y;
-(CGPoint) origin;
-(CGFloat) x;
-(CGFloat) y;
-(CGFloat) left;
-(CGFloat) top;
-(CGFloat) bottom;
-(CGFloat) right;
-(CGSize) size;
-(CGFloat) height;
-(CGFloat) width;
-(CGFloat) centerX;
-(CGFloat) centerY;
@end
