//
//  UncaughtExceptionHandler.m
//  Orpheus
//
//  Created by Ben Guo on 3/21/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

#import "UncaughtExceptionHandler.h"
@import Foundation;
@import UIKit;

volatile void exceptionHandler(NSException *exception) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"refresh2d://halp"]];
}
NSUncaughtExceptionHandler *exceptionHandlerPtr = &exceptionHandler;
