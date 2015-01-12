//
//  SortRoutines.h
//  InsertionSort
//
//  Created by Steven Shatz on 1/9/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortRoutines : NSObject

typedef long long int bigNum;

@property (assign, nonatomic) bigNum numberOfForLoopIterations;
@property (assign, nonatomic) bigNum numberOfWhileLoopIterations;
@property (assign, nonatomic) bigNum numberOfInstructionsExecuted;

- (void)doInsertionSortOnArray:(NSMutableArray *)array;

@end
