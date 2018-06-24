//
//  NetworkManager.h
//  Cats
//
//  Created by Will Chew on 2018-06-21.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface NetworkManager : NSObject

+ (void)fetchPictures: (void (^)(NSArray<Photo*>*))completion;

@end
