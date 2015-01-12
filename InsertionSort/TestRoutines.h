//
//  TestRoutines.h
//  InsertionSort
//
//  Created by Steven Shatz on 1/11/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArrayMaker.h"
#import "SortRoutines.h"
#import "Timer.h"
#import "CSVFileMaker.h"


@interface TestRoutines : NSObject {
    
    unsigned int arraySize;
    unsigned int numTests;
    unsigned int totalInstructions;
    double totalTime;
    
}

@property (retain, nonatomic) ArrayMaker *arrayMakerObject;

@property (retain, nonatomic) SortRoutines *sortRtnObject;

@property (retain, nonatomic) Timer *timerObject;

@property (retain, nonatomic) CSVFileMaker *csvFileMakerObject;

- (void)runAllTests;

@end
