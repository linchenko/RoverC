//
//  LRLMarsRoverClient.h
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRLRover.h"
#import "LRLPhoto.h"
#import "LRLSolDescription.h"

@interface LRLMarsRoverClient : NSObject

+(void)fetchAllMarsRoversWithBlock:(void(^)(NSArray<LRLRover*>* _Nullable rover))block;

+(void)fetchMissionManifestForRoverNamed:(NSString*)roverName withBlock:(void(^)(NSArray<LRLSolDescription*>* _Nullable photos))block;


+(void)fetchPhotosFromRover:(NSString*)roverName sol:(NSNumber*)sol withBlock:(void(^)(NSArray<LRLPhoto*>* _Nullable photo))block;
+(void)fetchImageDataForPhoto:(NSString*)imageURLString withBlock:(void(^)(NSData* _Nullable imageData))block;
@end
