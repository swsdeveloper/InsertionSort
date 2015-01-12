//
//  Timer.h
//  InsertionSort
//
//  Created by Steven Shatz on 1/10/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Timer : NSObject 

@property (retain, nonatomic) NSDate *start;
@property (retain, nonatomic) NSDate *end;

- (void)startTimer;
- (void)stopTimer;
- (double)timeElapsedInSeconds;
- (double)timeElapsedInMilliseconds;
- (double)timeElapsedInMinutes;

@end
