//
//  LRLRoverTableViewController.h
//  RoverC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRLRover.h"
#import "LRLMarsRoverClient.h"
#import "LRLSolTableViewController.h"

@interface LRLRoverTableViewController : UITableViewController

@property NSMutableArray<LRLRover*>*rovers;
@end
