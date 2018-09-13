//
//  LRLPhoto.m
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLPhoto.h"

@implementation LRLPhoto


-(instancetype)initWithDictionary:(NSDictionary*)photoDictionary
{
    NSNumber *photoID = photoDictionary[@"id"];
    NSNumber *sol = photoDictionary[@"sol"];
    NSString *imageURLString = photoDictionary[@"img_src"];
    NSString *earthDate = photoDictionary[@"earth_date"];
    NSString *cameraName = photoDictionary[@"camera"][@"full_name"];
    
    if (![photoID isKindOfClass:[NSNumber class]])
    {
        return nil;
        
    }

    self = [super init];
    if (self){
        _photoID = photoID;
        _sol = sol;
        _imageURLString = imageURLString;
        _earthDate = earthDate;
        _cameraName = cameraName;
    }
    return self;
    
}

-(Boolean)imageIsEqualto:(NSString*)imageURLString
{
    return [[self imageURLString]isEqualToString:imageURLString];
}
@end
