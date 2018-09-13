//
//  LRLSolDescription.h
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRLSolDescription : NSObject

@property (nullable) NSNumber * selectedSol;
@property (nullable) NSNumber * totalPhotos;
@property (nullable) NSMutableArray<NSString*> * cameras;

-(instancetype)initWithDictionary:(NSDictionary*)solDictionary;


@end
