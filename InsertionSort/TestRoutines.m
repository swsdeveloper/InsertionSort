//
//  TestRoutines.m
//  InsertionSort
//
//  Created by Steven Shatz on 1/11/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import "TestRoutines.h"


// Doing 1,000 tests (with array randomly shuffled for each test):
//   When arraySize = 10, avg # instructions exec'ed     = approx           150;           approx       0.004 ms
//   When arraySize = 100, avg # instructions exec'ed    = approx         8,000  (x  53);  approx       0.230 ms  (x 57)
//   When arraySize = 1000, avg # instructions exec'ed   = approx       730,000  (x  92);  approx      18.700 ms  (x 81)
//   When arraySize = 10000, avg # instructions exec'ed  = approx    73,000,000  (x 100);  approx   1,780.000 ms  (x 95)  = 1.8 seconds avg time per test
//      -- quit after about 60 tests (too slow)
//   When arraySize = 100000, avg # instructions exec'ed = approx 7,300,000,000  (x 100);  approx 178,000.000 ms (x 100)  = 178 seconds = 3 minutes avg time per test
//      -- quit after 3 tests (excruciatingly slow!!!)

// Same tests, but without code to count instructions inside Sort rtn - results basically the same:
//   When arraySize = 10,       approx       0.004 ms
//   When arraySize = 100,      approx       0.210 ms  (x 53)
//   When arraySize = 1000,     approx      16.700 ms  (x 80)
//   When arraySize = 10000,    approx   1,670.000 ms (x 100)  = 1.7 seconds avg time per test
//   When arraySize = 100000,   approx 162,000.000 ms (x 100)  = 162 seconds = 2.5 minutes avg time per test
//      -- quit after 3 tests (still excruciatingly slow!!!)


@implementation TestRoutines

- (void)runAllTests {
    
    self.arrayMakerObject = [[ArrayMaker alloc] init];
    self.sortRtnObject = [[SortRoutines alloc] init];
    self.timerObject = [[Timer alloc] init];
    self.csvFileMakerObject = [[CSVFileMaker alloc] init];
    
    NSString *testData = [NSString stringWithFormat:@"Array Size,Elapsed Time in ms\n"];    // Write heading line to CSV file
    [self.csvFileMakerObject writeToCsvFile:testData];
    
    numTests = 100;
    
    //    for (arraySize = 10; arraySize < 10000000; arraySize *= 10) {        // arraySize = 10, 100, 1000, 10000, 100000, 1000000
    
    for (arraySize = 1000000; arraySize <= 10000000; arraySize += 1000000) {        // arraySize = 1 million, 2 million, ..., 10 million
        
        NSLog(@"\nStarting Tests for Array Size: %d", arraySize);
        
        [self.arrayMakerObject genArrayOfSize:arraySize];
        
        totalInstructions = 0;  // re-init totals for Average calcs
        totalTime = 0.0;
        
        for (int i = 0; i < numTests; ++i) {
            if (arraySize > 1000) { NSLog(@"Test # %d", i+1); }
            [self sortTheArray];
        }
        
        //    NSLog(@"\nTest Average = %d / %d = %f Instructions", totalInstructions, numTests, (totalInstructions / (double)numTests));
        
        NSLog(@"\nTest Average = %f / %d = %f Milliseconds", totalTime, numTests, (totalTime / (double)numTests));
        
        NSLog(@"Ending Tests for Array Size: %d\n", arraySize);
    }
}

- (void)sortTheArray {
    [self.arrayMakerObject shuffleArray];
    
    //    NSLog(@"\nBefore Sort: %@", [self.arrayMakerObject.array description]);
    
    [self.timerObject startTimer];
    
    //    NSLog(@"startTimer: %@", [self.timerObject.start description]);
    
    [self.sortRtnObject doInsertionSortOnArray:self.arrayMakerObject.array];
    
    [self.timerObject stopTimer];
    
    //    NSLog(@" stopTimer: %@", [self.timerObject.end description]);
    //    NSLog(@"After  Sort: %@", [self.arrayMakerObject.array description]);
    //    NSLog(@"# of  For  Loop Iterations = %lld", self.sortRtnObject.numberOfForLoopIterations);
    //    NSLog(@"# of While Loop Iterations = %lld", self.sortRtnObject.numberOfWhileLoopIterations);
    
    bigNum instructionsExecuted = self.sortRtnObject.numberOfInstructionsExecuted;
    totalInstructions += instructionsExecuted;
    
    double elapsedTime = [self.timerObject timeElapsedInMilliseconds];
    totalTime += elapsedTime;
    
    //    NSLog(@"Array Size = %d, # of Instructions Executed = %lld, Elapsed Time = %f ms", arraySize, instructionsExecuted, elapsedTime);
    //    NSLog(@"Array Size = %d, Elapsed Time = %f ms", arraySize, elapsedTime);
    
    NSString *testData = [NSString stringWithFormat:@"%d,%f\n", arraySize, elapsedTime];    // Write the results of this test to CSV File
    [self.csvFileMakerObject writeToCsvFile:testData];
}

@end
