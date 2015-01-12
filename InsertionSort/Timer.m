//
//  Timer.m
//  InsertionSort
//
//  Created by Steven Shatz on 1/10/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import "Timer.h"
#import "Constants.h"


@implementation Timer

- (id) init {
    self = [super init];
    if (self) {
        _start = nil;
        _end = nil;
    }
    return self;
}

- (void)startTimer {
    self.start = [NSDate date];
//    NSLog(@"startTimer: %@", [self.start description]);
}

- (void)stopTimer {
    self.end = [NSDate date];
//    NSLog(@"stopTimer: %@", [self.end description]);
}

- (double)timeElapsedInSeconds {
    return [self.end timeIntervalSinceDate:self.start];
}

- (double)timeElapsedInMilliseconds {
    return [self timeElapsedInSeconds] * 1000.0f;
}

- (double)timeElapsedInMinutes {
    return [self timeElapsedInSeconds] / 60.0f;
}

@end
