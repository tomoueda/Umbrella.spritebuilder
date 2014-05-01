//
//  Communicator.m
//  Umbrella
//
//  Created by Tomo Ueda on 5/1/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "Communicator.h"

@implementation Communicator


- (id) init {
    self = [super init];
    {
        _schedule = true;
    }
    return self;
}


- (void) stopSchedules {
    _schedule = false;
}

- (bool) getSignal {
    return _schedule;
}


@end
