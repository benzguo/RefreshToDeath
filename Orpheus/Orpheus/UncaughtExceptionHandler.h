//
//  UncaughtExceptionHandler.h
//  Orpheus
//
//  Created by Ben Guo on 3/21/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

#import <Foundation/Foundation.h>

volatile void exceptionHandler(NSException *exception);
extern NSUncaughtExceptionHandler *exceptionHandlerPtr;