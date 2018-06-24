//
//  Cat.h
//  Cats
//
//  Created by Will Chew on 2018-06-21.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *farm;
@property (nonatomic, copy) NSString *identity;
@property (nonatomic, copy) NSString *secret;
@property (nonatomic,copy) NSString *server;
@property (nonatomic, copy) NSURL *pictureURL;

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@end
