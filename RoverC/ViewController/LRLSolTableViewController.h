//
//  LRLSolTableViewController.h
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRLRover.h"
#import "LRLSolDescription.h"
@interface LRLSolTableViewController : UITableViewController

@property (nonatomic, readwrite) LRLRover *rover;
@property (nonatomic) NSMutableArray<LRLSolDescription*> * solDescriptions;

@end
