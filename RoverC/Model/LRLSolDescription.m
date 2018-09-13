//
//  LRLSolDescription.m
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLSolDescription.h"

@implementation LRLSolDescription


-(instancetype)initWithDictionary:(NSDictionary*)solDictionary
{
    NSNumber *selectedSol = solDictionary[@"sol"];
    NSNumber *totalPhotos = solDictionary[@"total_photos"];
    NSMutableArray *cameras = solDictionary[@"cameras"];
    
    if (![selectedSol isKindOfClass:[NSNumber class]]){
        return nil;
    }
    
    self = [super init];
    if (self){
        _selectedSol = selectedSol;
        _totalPhotos = totalPhotos;
        _cameras = cameras;
    }
    return self;
}

@end
