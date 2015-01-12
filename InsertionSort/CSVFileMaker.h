//
//  CSVFileMaker.h
//  InsertionSort
//
//  Created by Steven Shatz on 1/11/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CSVFileMaker : NSObject

@property (retain, nonatomic) NSString *docPath;

@property (retain, nonatomic) NSString *csvFileName;

- (void)writeToCsvFile:(NSString *)csvData;

@end
