//
//  RTDUncaughtExceptionHandler.m
//  RefreshToDeath
//
//  Created by Ben Guo on 3/21/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

#import "RTDUncaughtExceptionHandler.h"
@import Foundation;
@import UIKit;

volatile void exceptionHandler(NSException *exception) {
    NSLog(@"EXCEPTION");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"orpheus://halp"]];
}
NSUncaughtExceptionHandler *exceptionHandlerPtr = &exceptionHandler;
