//
//  NetworkManager.m
//  Cats
//
//  Created by Will Chew on 2018-06-21.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (void)fetchPictures:(void (^)(NSArray<Photo*>*))completion;
{
    
    NSURL *url = [NSURL URLWithString: @"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=e91cbbe6831cb5fb8f32aa25b4d013ee&tags=cat"];
    NSURLSessionDataTask *task =[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Got response: %@", response);
        
        
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        if (httpResponse.statusCode != 200){
            NSLog(@"Bad reponse from API: %@", httpResponse);
            completion(nil);
            return;
        }
//        NSLog(@"DATA: %@", data);
        NSError *err = nil;
        NSDictionary *catJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
        NSDictionary *catPhotoJson = [[catJson objectForKey:@"photos"] objectForKey:@"photo"];
        
        if (err != nil) {
            NSLog(@"Error parsing JSON: %@", err.localizedDescription);
            completion(nil);
            return;
        }
        
        NSMutableArray *catInfoArray = [@[] mutableCopy];
        
        for (NSDictionary *item in catPhotoJson)
        {
            Photo *photo = [[Photo alloc]initWithDictionary:item];
            [catInfoArray addObject:photo];
        
            
        }
        NSArray<Photo*>* result = [catInfoArray copy];
        
        completion(result);
        
    }];
    [task resume];
}

@end
