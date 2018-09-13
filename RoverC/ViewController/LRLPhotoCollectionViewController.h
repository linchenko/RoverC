//
//  LRLPhotoCollectionViewController.h
//  RoverC
//
//  Created by Levi Linchenko on 13/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRLSolDescription.h"
#import "LRLRover.h"
#import "LRLPhoto.h"
#import <UIKit/UIKit.h>
#import "LRLMarsRoverClient.h"
#import "LRLPhotoCollectionViewCell.h"
#import "RoverC-Bridging-Header.h"





@interface LRLPhotoCollectionViewController : UICollectionViewController

@property LRLSolDescription * solDescription;
@property LRLRover * rover;
@property (nonatomic) NSMutableArray<LRLPhoto*> * photos;
@property NSMutableArray<UIImage*> * images;



@end
