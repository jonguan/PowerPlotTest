//
//  ViewController.m
//  PowerPlotTest
//
//  Created by Jonathan Guan on 8/17/13.
//  Copyright (c) 2013 Scanadu. All rights reserved.
//

#import "ViewController.h"
#import "WSChart.h"
#import "WSChart+WSBarPlotFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    float sourceData[10] = { 5, -2, 3, 7, 0, 1, -1, 3, 3, 5 };
    float sourceData1[10] = { 3, 2, 1, 5, 6, 7, 2, 4, 6, 8};
    
    self.allData = [WSData dataWithValues:[WSData arrayWithFloat:sourceData
                                                             len:10]
                                  valuesX:[WSData arrayOfZerosWithLen:10]];
    self.allData = [self.allData indexedData];
    
    self.line2Data = [WSData dataWithValues:[WSData arrayWithFloat:sourceData1 len:10]];
    self.line2Data = [self.line2Data indexedData];
    [self toggleControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didToggleControl:(id)control
{
    [self toggleControl];
}

- (void)toggleControl
{
    WSChart *tmp;
    switch ([self.segControl selectedSegmentIndex]) {
        case 0:
            tmp = [WSChart barPlotWithFrame:[self.wsChart frame]
                                       data:self.allData
                                      style:kChartBarPlain
                                colorScheme:kColorLight];
            [self.wsChart removeAllPlots];
            [self.wsChart addPlotsFromChart:tmp];
            break;
        case 1:
        {
            tmp = [WSChart linePlotWithFrame:[self.wsChart frame]
                                        data:self.allData
                                       style:kChartLinePlain
                                   axisStyle:kCSArrows
                                 colorScheme:kColorGray
                                      labelX:@""
                                      labelY:@""];
            WSChart *tmp1 = [WSChart linePlotWithFrame:self.wsChart.frame
                                                  data:self.line2Data
                                                 style:kChartLinePlain
                                             axisStyle:kCSArrows
                                           colorScheme:kColorDark
                                                labelX:@""
                                                labelY:@""];
            
            [self.wsChart removeAllPlots];
//            [self.wsChart addPlotsFromChart:tmp1];
            [self.wsChart addPlotsFromChart:tmp];

            [self.wsChart setAllAxisPreserveOnChangeX:kPreserveRelative];
            [self.wsChart setAllAxisPreserveOnChangeY:kPreserveRelative];
            
            WSPlotController *aCtrl = [self.wsChart plotAtIndex:0];
            [aCtrl setMaximumZoomScaleXD:2.
                      maximumZoomScaleYD:2.
                      minimumZoomScaleXD:0.75
                      minimumZoomScaleYD:0.75];
            NAFloat scaleX = NARangeLen(aCtrl.zoomRangeXD);
            NAFloat scaleY = NARangeLen(aCtrl.zoomRangeYD);
            aCtrl.zoomRangeXD = NARangeMake(scaleX/3, scaleX*1.25);
            aCtrl.zoomRangeYD = NARangeMake(scaleY/3, scaleY*1.25);
            [aCtrl setScrollEnabled:YES];
            [aCtrl setZoomEnabled:YES];
            
            // Configure the single tap feature.
            [aCtrl setTapEnabled:YES];
            aCtrl.delegate = self;
            aCtrl.hitTestMethod = (kHitTestX | kHitTestY);
            aCtrl.hitResponseMethod = kHitResponseDatum;
            
            break;
        }
            
        default:
            break;
    }
    [self.wsChart setNeedsDisplay];
}

#pragma mark - WSControllerGestureDelegate

- (void)controller:(WSPlotController *)controller
  singleTapAtDatum:(NSInteger)i {
    NSLog(@"Datum hit: %d.", i);
}

@end
