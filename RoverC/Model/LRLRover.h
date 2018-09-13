//
//  LRLRover.h
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRLSolDescription.h"

@interface LRLRover : NSObject

@property(nullable, copy) NSString *roverName;
@property(nullable, copy) NSString *launchDate;
@property(nullable, copy) NSString *landingDate;
@property(nullable) NSNumber *maxSol;
@property(nullable, copy) NSString *maxDate;
@property(nullable) NSNumber *totalPhotos;
@property(nullable) NSArray<LRLSolDescription*>*solDescriptions;
@property(nullable, copy) NSString *status;

-(instancetype)initWithDictionary:(NSDictionary*)roverDictionary;

@end
