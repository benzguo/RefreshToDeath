//
//  RTDUncaughtExceptionHandler.m
//  RefreshToDeath
//
//  Created by Ben Guo on 3/21/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

#import "UncaughtExceptionHandler.h"
@import Foundation;
@import UIKit;

volatile void exceptionHandler(NSException *exception) {
    NSURL *url = [NSURL URLWithString:@"orpheus://halp"];
    [[UIApplication sharedApplication] openURL:url];
}
NSUncaughtExceptionHandler *exceptionHandlerPtr = &exceptionHandler;
