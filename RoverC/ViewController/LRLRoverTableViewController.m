//
//  LRLRoverTableViewController.m
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import "LRLRoverTableViewController.h"


@interface LRLRoverTableViewController ()

@end

@implementation LRLRoverTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [LRLMarsRoverClient fetchAllMarsRoversWithBlock:^(NSArray<LRLRover *> * _Nullable rover) {
        if (rover){
            self.rovers = [[NSMutableArray alloc] init];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self rovers]addObjectsFromArray:rover];
                [[self tableView]reloadData];
            });
            
            
        }
    
    }];
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _rovers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roverCell" forIndexPath:indexPath];
    
    LRLRover* rover = _rovers[indexPath.row];
    cell.textLabel.text = rover.roverName;
    
    
    return cell;
}







#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqual:@"toSolVC"]){
        LRLSolTableViewController *destinationVC = (segue.destinationViewController);
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LRLRover *rover = self.rovers[indexPath.row];
        destinationVC.rover = rover;
    }
}


@end
