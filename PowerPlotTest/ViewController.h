//
//  ViewController.h
//  PowerPlotTest
//
//  Created by Jonathan Guan on 8/17/13.
//  Copyright (c) 2013 Scanadu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PowerPlot.h"

@interface ViewController : UIViewController <WSControllerGestureDelegate>

@property (nonatomic, weak) IBOutlet WSChart *wsChart;
@property (nonatomic, weak) IBOutlet UISegmentedControl *segControl;


@property (nonatomic, strong) WSData *allData;
@property (nonatomic, strong) WSData *line2Data;

- (IBAction)didToggleControl:(id)control;
- (void)toggleControl;

@end
