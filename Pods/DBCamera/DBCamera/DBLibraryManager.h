//
//  DBLibraryManager.h
//  DBCamera
//
//  Created by iBo on 05/03/14.
//  Copyright (c) 2014 PSSD - Daniele Bogo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef void (^AssetGroupEnumerator)(ALAssetsGroup *group, BOOL *stop);
typedef void (^ItemsCompletionBlock)( BOOL success, NSArray *items );
typedef void (^LastItemCompletionBlock)( BOOL success, UIImage *image );

@interface DBLibraryManager : NSObject {
    ItemsCompletionBlock _itemsCompletionBlock;
    LastItemCompletionBlock _lastItemCompletionBlock;
}

@property (nonatomic, assign, readonly) BOOL getAllAssets;
@property (nonatomic, copy) AssetGroupEnumerator assetGroupEnumerator;

+ (DBLibraryManager *) sharedInstance;

- (ALAssetsLibrary *) defaultAssetsLibrary;
- (void) loadLastItemWithBlock:(LastItemCompletionBlock)blockhandler;
- (void) loadAssetsWithBlock:(ItemsCompletionBlock)blockhandler;
- (AssetGroupEnumerator) assetGroupEnumerator;

@end