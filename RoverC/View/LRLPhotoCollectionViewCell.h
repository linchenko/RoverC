//
//  LRLPhotoCollectionViewCell.h
//  RoverC
//
//  Created by Levi Linchenko on 13/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRLPhoto.h"


@interface LRLPhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic, readwrite) LRLPhoto * photo;

@property (weak, nonatomic) IBOutlet UIImageView *imageOutlet;

-(void)updateView;



@end
