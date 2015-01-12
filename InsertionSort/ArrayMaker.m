//
//  ArrayMaker.m
//  InsertionSort
//
//  Created by Steven Shatz on 1/10/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import "ArrayMaker.h"
#import "Constants.h"

#define maxRandomNumber 10


@implementation ArrayMaker

- (id)init {
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

// Gen array consisting of random # of NSNumbers from 1 to |randomSize|
- (void)genRandomSizeArray {
    unsigned int randomSize = [self genRandomNumberFrom:1 to:maxRandomNumber];
    [self genArrayOfSize:randomSize];
}

// Gen array consisting of specified range of NSNumbers from 1 to |max|
- (void)genArrayOfSize:(unsigned int)size {
    
    for (unsigned int i = 0; i < size; ++i) {
        self.array[i] = [NSNumber numberWithInteger:i + 1];
    }
}

- (void)shuffleArray {
    
    unsigned int count = (unsigned int)[self.array count];     // Downcast |count| from NSUInteger (which varies in size for 32-bit vs 64-bit systems) to a fixed size
    
    for (unsigned int i = 0; i < count; ++i) {
        unsigned int seed = count - 1;
        unsigned int j = arc4random_uniform(seed);              // gen random index value from 0 to count-1
        [self.array exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
}

- (unsigned int)genRandomNumberFrom:(unsigned int)min to:(unsigned int)max {
    
    // By definition, NUSInteger must be 0 or positive, so 0 is smallest possible number that can be passed
    // gen random number |min| to |max|, inclusive:
    //   1 -  2 ->  (2-0) + 1 ->  (2) + 1 -> (0 to 1) + 1
    //   1 - 10 -> (10-0) + 1 -> (10) + 1 -> (0 to 9) + 1
    //   2 - 10 -> (10-1) + 2 ->  (9) + 1 -> (0 to 8) + 2
    //   4 - 11 -> (11-3) + 4 ->  (8) + 4 -> (0 to 7) + 4
    //   4 -  5 ->  (5-3) + 4 ->  (2) + 4 -> (0 to 1) + 4
    //   0 -  5 ->  (5--1) + 0 -> (6) + 0 -> (0 to 5) + 0
    //   4 -  4 -> Result can only be 4, which is not random! So max must be at least 1 greater than min!!!
    
    if (min == UINT_MAX) { min = UINT_MAX - 1; }    // Ensure we can add 1 to min for next instruction
    if (max < min + 1) { max = min + 1; }
    
    unsigned int seed = max - min + 1;
    
    // Why it is no good to use NSUInteger as parms and return value:
    //  - NSUInteger is a typedef for unsigned long
    //  - Max unsigned long = 4,294,967,295 (32-bit) or 18,446,744,073,709,551,615 (64-bit)
    //  - Max seed that arc4random_uniform accepts = 4,294,967,295 (which is the max uint32_t value)
    // Instead, use unsigned int:
    //  - unsigned int does not vary in size between 32 and 64 bit systems - its max = 4,294,967,295. This is same as uint32_t
    //  - both min and max cannot be less than 0, since they are unsigned
    //  - neither min nor max can exceed UINT_MAX, but that's OK, 4 billion array entries is way more than we need for testing
    
    return arc4random_uniform(seed) + min;  // gen a random number between |min| and |max|, inclusive
}

@end
