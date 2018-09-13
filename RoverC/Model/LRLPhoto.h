//
//  LRLPhoto.h
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LRLPhoto : NSObject

@property (nullable) NSNumber* photoID;
@property (nullable) NSNumber* sol;
@property (nullable, copy) NSString* imageURLString;
@property (nullable, copy) NSString* earthDate;
@property (nullable, copy) NSString* cameraName;
@property (nullable) UIImage * image;

-(instancetype)initWithDictionary:(NSDictionary*)photoDictionary;
-(Boolean)imageIsEqualto:(NSString*)image;

@end
