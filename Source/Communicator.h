//
//  Communicator.h
//  Umbrella
//
//  Created by Tomo Ueda on 5/1/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Communicator : NSObject

{
    bool _schedule;
}

- (id) init;
- (void) stopSchedules;
- (bool) getSignal;

@end
