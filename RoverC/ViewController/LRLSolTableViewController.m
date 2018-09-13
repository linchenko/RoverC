//
//  LRLSolTableViewController.m
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLSolTableViewController.h"
#import "LRLMarsRoverClient.h"
#import "LRLPhotoCollectionViewController.h"

@interface LRLSolTableViewController ()

@end

@implementation LRLSolTableViewController

-(void)updateViews: (LRLRover*)rover{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LRLMarsRoverClient fetchMissionManifestForRoverNamed:self.rover.roverName withBlock:^(NSArray<LRLSolDescription *> * _Nullable photos) {
        if (photos){
            self.solDescriptions = [[NSMutableArray alloc] init];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self solDescriptions]addObjectsFromArray:photos];
                [[self tableView]reloadData];
            });
        }
    }];

    

    
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self solDescriptions].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"solCell" forIndexPath:indexPath];
    LRLSolDescription * solDescription = self.solDescriptions[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", solDescription.selectedSol];
    cell.detailTextLabel.text = [NSString stringWithFormat: @"%@", solDescription.totalPhotos];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"toDetailVC"]){
        LRLPhotoCollectionViewController *destinationVC = (segue.destinationViewController);
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LRLSolDescription * solDescription = self.solDescriptions[indexPath.row];
        destinationVC.solDescription = solDescription;
        destinationVC.rover = self.rover;
        
    }
}


@end
