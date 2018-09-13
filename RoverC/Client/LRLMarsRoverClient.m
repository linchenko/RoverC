//
//  LRLMarsRoverClient.m
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLMarsRoverClient.h"

@implementation LRLMarsRoverClient

+(void)fetchAllMarsRoversWithBlock:(void(^)(NSArray<LRLRover*>* _Nullable rover))block
{
    NSURL *baseUrl = [NSURL URLWithString:@"https://api.nasa.gov/mars-photos/api/v1/rovers?api_key=AbPmGbLtKcRCo8LlAEhV1jx5pDvcCe6NxOhyOI3m"];
    [[[NSURLSession sharedSession]dataTaskWithURL:baseUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Problem with function %s %@, %@",__FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        if (!data)
        {
            NSLog(@"No data");
            block(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSMutableArray *roversArray = jsonDictionary[@"rovers"];
        NSMutableArray *rovers = [[NSMutableArray alloc]init];
        for (NSDictionary * roverDictionary in roversArray){
            LRLRover * rover = [[LRLRover alloc] initWithDictionary:roverDictionary];
            [rovers addObject:rover];
        }
        block(rovers);
    }]resume];
}


+(void)fetchMissionManifestForRoverNamed:(NSString*)roverName withBlock:(void(^)(NSArray<LRLSolDescription*>* _Nullable photos))block
{
    
    NSURL *baseUrl = [NSURL URLWithString:@"https://api.nasa.gov/mars-photos/api/v1/manifests/"];
    NSURL *url = [baseUrl URLByAppendingPathComponent:roverName];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"api_key" value:@"AbPmGbLtKcRCo8LlAEhV1jx5pDvcCe6NxOhyOI3m"];
    NSURLComponents * componenets = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:true];
    componenets.queryItems = [[NSArray alloc] initWithObjects:queryItem, nil];
    NSURL * finshedURL = componenets.URL;
    
    [[[NSURLSession sharedSession]dataTaskWithURL:finshedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Problem with function %s %@, %@",__FUNCTION__, error, error.localizedDescription);
            
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        if (!data){
            NSLog(@"No data at function %s", __FUNCTION__);
            block(nil);
            return;
        }
        NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSMutableArray * photoManifest = jsonDictionary[@"photo_manifest"][@"photos"];
        NSMutableArray * sols = [[NSMutableArray alloc] init];
        for (NSDictionary * photoDictionary in photoManifest){
            LRLSolDescription * sol = [[LRLSolDescription alloc] initWithDictionary:photoDictionary];
            [sols addObject:sol];
        }
        block(sols);
    }]resume];
    
}


+(void)fetchPhotosFromRover:(NSString*)roverName sol:(NSNumber*)sol withBlock:(void(^)(NSArray<LRLPhoto*>* _Nullable photo))block
{
    NSURL *baseUrl = [NSURL URLWithString:@"https://api.nasa.gov/mars-photos/api/v1/rovers/"];
    NSURL * builtURL = [[baseUrl URLByAppendingPathComponent:roverName]URLByAppendingPathComponent:@"photos"];
    NSURLComponents * componets = [[NSURLComponents alloc] initWithURL:builtURL resolvingAgainstBaseURL:true];
    NSURLQueryItem * queryItem = [NSURLQueryItem queryItemWithName:@"sol" value:[NSString stringWithFormat:@"%@", sol]];
    NSURLQueryItem * queryItem1 = [NSURLQueryItem queryItemWithName:@"api_key" value:@"AbPmGbLtKcRCo8LlAEhV1jx5pDvcCe6NxOhyOI3m"];
    componets.queryItems = [[NSArray alloc] initWithObjects:queryItem, queryItem1, nil];
    NSURL * url = componets.URL;
    
    NSLog(@"%@", [url absoluteString]);
    
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Problem with function %s %@, %@",__FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        if (!data){
            NSLog(@"No data in function %s", __FUNCTION__);
        }
        NSDictionary * jsonDicitonary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSMutableArray * photosArray = jsonDicitonary[@"photos"];
        NSMutableArray * photos = [[NSMutableArray alloc] init];
        for (NSDictionary * photoDictionary in photosArray){
            LRLPhoto * photo = [[LRLPhoto alloc] initWithDictionary:photoDictionary];
            [photos addObject:photo];
        }
        block(photos);
    }]resume];
    
    
}
+(void)fetchImageDataForPhoto:(NSString*)imageURLString withBlock:(void(^)(NSData* _Nullable imageData))block
{
    NSURL *baseUrl = [NSURL URLWithString:imageURLString];
    NSLog(@"%@", baseUrl);
    [[[NSURLSession sharedSession]dataTaskWithURL:baseUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Problem with function %s %@, %@",__FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        if (!data){
            NSLog(@"No data in function %s", __FUNCTION__);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        block(data);
    }]resume];
}

@end
