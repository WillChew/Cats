//
//  Cat.m
//  Cats
//
//  Created by Will Chew on 2018-06-21.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithDictionary:(NSDictionary *)dict{

    self = [super init];
    if (self) {
        _title = dict[@"title"];
        _identity = dict[@"id"];
        _server = dict[@"server"];
        _farm = dict[@"farm"];
        _secret = dict[@"secret"];
        _pictureURL = [NSURL URLWithString: [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", self.farm, self.server, self.identity, self.secret]];
    }
    return self;
}

@end
