//
//  ArrayMaker.h
//  InsertionSort
//
//  Created by Steven Shatz on 1/10/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrayMaker : NSObject

@property (retain, nonatomic) NSMutableArray *array;

- (void)genRandomSizeArray;

- (void)genArrayOfSize:(unsigned int)size;

- (void)shuffleArray;

@end
