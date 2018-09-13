//
//  LRLPhotoCollectionViewCell.m
//  RoverC
//
//  Created by Levi Linchenko on 13/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLPhotoCollectionViewCell.h"

@implementation LRLPhotoCollectionViewCell

-(void)updateView{
    [self imageOutlet].image = [self photo].image;
}

-(void)setPhoto:(LRLPhoto*)photo{
    _photo = photo;
    [self updateView];
}

@end
