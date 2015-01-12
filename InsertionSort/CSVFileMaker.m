//
//  CSVFileMaker.m
//  InsertionSort
//
//  Created by Steven Shatz on 1/11/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

#import "CSVFileMaker.h"
#import "Constants.h"


@implementation CSVFileMaker

- (id)init {
    self = [super init];
    if (self) {
        _docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        // point to current user's |documents| directory
    
        _csvFileName = [_docPath stringByAppendingPathComponent:@"insertionSortStatistics2.csv"];    // full path to our CSV file
        
        // If CSV file exists, delete it
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:self.csvFileName]) {
            NSLog(@"Attempting to delete existing csv file: %@\n", self.csvFileName);
            NSError *error;
            BOOL success = [[NSFileManager defaultManager] removeItemAtPath:_csvFileName error:&error];
            if (!success) {
                NSLog(@"Delete error: %@\n", [error localizedDescription]);
            }
        }
    }
    return self;
}

// Write data to CSV File
- (void)writeToCsvFile:(NSString *)csvData {
    
    // If CSV file does not yet exist, create it. Otherwise, do nothing (we will append to it)
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:self.csvFileName]) {
        [[NSFileManager defaultManager] createFileAtPath:self.csvFileName contents:nil attributes:nil];
        NSLog(@"Created CSV file: %@\n", self.csvFileName);
    }
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:self.csvFileName];
    [fileHandle seekToEndOfFile];                                               // position cursor at end of file
    [fileHandle writeData:[csvData dataUsingEncoding:NSUTF8StringEncoding]];    // append latest line to end of CSV file
    [fileHandle closeFile];                                                     // make sure latest data gets written
    
    NSLog(@"Info saved: %@", csvData);
}

@end
