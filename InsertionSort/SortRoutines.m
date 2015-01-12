//
//  SortRoutines.m
//  InsertionSort
//
//  Created by Steven Shatz on 1/9/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import "SortRoutines.h"
#import "Constants.h"


@implementation SortRoutines

// |array| gets sorted in place, so it must be a Mutable array
// Assumption: all elements in |array| are of the same type
// Assumption: all elements in |array| are of type NSNumber
// Sort in ascending order

- (void)doInsertionSortOnArray:(NSMutableArray *)array {        // Performance: Best case =  n, Average case = n^2, Worst case = n^2
    
    bigNum numElements = [array count];
    
    if (numElements < 2) {      // Array is empty or has only 1 element
        NSLog(@"Array is empty or has only 1 element - no sort needed");
        return;
    }
    
    bigNum i, currentElementIndex;  // indexes into |array|
    
    NSNumber *currentElement;
    
    // Start at 2nd element in array (i.e., array[1]). This is |currentElement|
    // Compare |currentElement| to all preceding elements, working backwards (i.e., towards the left), 1 element at a time
    // Whenever a previous element is > |currentElement|, move previous element 1 position towards the right
    // When a previous element is < or = |currentElement|, stop comparing this |currentElement| and move it to the last checked previous element that was > |currentElement|
    // Then change |currentElement| to be the next element to its right
    //
    // All elements to the Left of each |currentElement| are in sorted order
    // All elements to the right of each |currentElement| have not yet been checked, so we don't know whether they are in sorted order

//    self.numberOfForLoopIterations = 0;             // init counters
//    self.numberOfWhileLoopIterations = 0;
//    self.numberOfInstructionsExecuted = 0;
//    
//    int numberOfInstructionsWithinForLoop = 5;      // Excluding the While Loop
//    int numberOfInstructionsWithinWhileLoop = 2;
    
    for (currentElementIndex = 1; currentElementIndex < numElements; currentElementIndex++) {
        
//        ++self.numberOfForLoopIterations;
        
        currentElement = array[currentElementIndex];
        
        i = currentElementIndex - 1;        // start compare with element immediately to the left of current element
        
        while (i >= 0 && [array[i] compare:currentElement] == NSOrderedDescending) {   // while ith element > curr element
            
//            ++self.numberOfWhileLoopIterations;
            
            [array exchangeObjectAtIndex:currentElementIndex withObjectAtIndex:currentElementIndex - 1];
            
//            array[i+1] = array[i--];        // move ith element 1 position to the right; then point |i| to previous element (i.e., shift index 1 pos to left)
            
        }  // While loop ends when there are no more elements to check  OR  when the ith element < or = curr element
        
//        ++self.numberOfWhileLoopIterations; // add 1 to account for final While Loop test which will fail
        
        array[i+1] = currentElement;        // move currentElement to the last position tested by the while loop
    }
    
//    ++self.numberOfForLoopIterations;       // add 1 to account for final For Loop test which will fail
    
//    self.numberOfInstructionsExecuted = self.numberOfForLoopIterations
//                                      + self.numberOfWhileLoopIterations
//                                      + ( (self.numberOfForLoopIterations - 1)   * numberOfInstructionsWithinForLoop)
//                                      + ( (self.numberOfWhileLoopIterations - 1) * numberOfInstructionsWithinWhileLoop);
    
}

@end
