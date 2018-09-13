//
//  LRLRover.m
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLRover.h"

@implementation LRLRover


-(instancetype)initWithDictionary:(NSDictionary*)roverDictionary
{
    NSString *roverName = roverDictionary[@"name"];
    NSString *launchDate = roverDictionary[@"launch_date"];
    NSString *landingDate = roverDictionary[@"landing_date"];
    NSNumber *maxSol = roverDictionary[@"max_sol"];
    NSString *maxDate = roverDictionary[@"max_date"];
    NSNumber *totalPhotos = roverDictionary[@"total_photos"];
    NSString *status = roverDictionary[@"status"];
    
    if (![roverName isKindOfClass:[NSString class]])
    {
        return nil;
    }
    self = [super init];
    if (self)
    {
    _roverName = roverName;
    _launchDate = launchDate;
    _landingDate = landingDate;
    _maxSol = maxSol;
    _maxDate = maxDate;
    _totalPhotos = totalPhotos;
    _status = status;
    }
    return self;
    
}



@end
