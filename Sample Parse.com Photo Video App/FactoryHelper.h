//
//  FactoryHelper.h
//  Pack
//
//  Created by applegod on 10.01.14.
//  Copyright (c) 2014 Pack LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactoryHelper : NSObject


+ (FactoryHelper*)sharedClient;

- (void)presentLoginViewController;

@end
