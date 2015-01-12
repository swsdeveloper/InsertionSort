//
//  ViewController.m
//  InsertionSort
//
//  Created by Steven Shatz on 1/9/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testRoutineObject = [[TestRoutines alloc] init];

    [self.testRoutineObject runAllTests];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
