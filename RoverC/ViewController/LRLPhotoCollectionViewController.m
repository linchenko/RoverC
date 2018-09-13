//
//  LRLPhotoCollectionViewController.m
//  RoverC
//
//  Created by Levi Linchenko on 13/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLPhotoCollectionViewController.h"
#import "RoverC-Swift.h"




@interface LRLPhotoCollectionViewController ()

@end

@implementation LRLPhotoCollectionViewController

static NSString * const reuseIdentifier = @"photoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchPhotoReferences];
}

-(void)fetchPhotoReferences{
    
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_group_enter(dispatchGroup);
    [LRLMarsRoverClient fetchPhotosFromRover:_rover.roverName sol:_solDescription.selectedSol withBlock:^(NSArray<LRLPhoto *> * _Nullable photos) {
        if (photos){
            self.photos = [[NSMutableArray alloc] init];
            self.images = [[NSMutableArray alloc] init];
            
            for (LRLPhoto * photo in photos) {
                dispatch_group_enter(dispatchGroup);
                [LRLMarsRoverClient fetchImageDataForPhoto:photo.imageURLString withBlock:^(NSData * _Nullable imageData) {
                    UIImage *image = [UIImage imageWithData:imageData];
                    photo.image = image;
                    dispatch_group_leave(dispatchGroup);
                }];
            }
            dispatch_group_leave(dispatchGroup);
            
        }
        dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^{
            [[self photos] addObjectsFromArray:photos];
            [[self collectionView] reloadData];
        });
        
        
    }];
    
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"toDetailVC"]) {
                LRLPictureDetailViewController *destinationVC = [segue destinationViewController];
                NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];
                [destinationVC photo] = 
    }
}


#pragma mark <UICollectionViewDataSource>



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LRLPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    LRLPhoto * photo = _photos[indexPath.row];
    cell.photo = photo;
    
    
    return cell;
}



@end
