//
//  FlyingItem.m
//  Umbrella
//
//  Created by Logan Carter on 4/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "FlyingItem.h"
#import "Communicator.h"
#import "Girl.h"

#define ARC4RANDOM_MAX      0x100000000

@implementation FlyingItem

- (id) init {
    self = [super init];
    if (self) {
        _collision = false;
        _interval = .0006;
        [self schedule:@selector(updateAndCheckCollision) interval:_interval];
    }
   return self;
}

- (void) setGirl: (Girl *) girl {
    _girl = girl;
}

- (void) setCommunicator: (Communicator *) communicator {
    _communicator = communicator;
}

-(void) moveup {
    self.position = ccp(self.position.x, self.position.y + 1);
    if (self.position.y >= 566) {
        int r = arc4random() % 326;
        self.position = ccp(r, 0);
    }
}

/** This function does three things. One it updates the position of the
    flying item. Two it checks if the girl collides. Three 
    if the girl collides, we end the game from this object.
 
    This is a poor practice
    in terms of understanding the code, but thought it appropriate
    just for this function, because we only have to deal with one selector.
**/
- (void) updateAndCheckCollision {
    if (![_communicator getSignal]) {
        [self unschedule:@selector(updateAndCheckCollision)];
    } else {
        self.position = ccp(self.position.x, self.position.y + 1);
        if (self.position.y >= 566) {
            int r = arc4random() % 326;
            self.position = ccp(r, 0);
        }
        _collision = [self checkCollision];
        if (_collision) {
            [self endGame];
        }
    }
//    _interval = .0006 + ((double)arc4random() / ARC4RANDOM_MAX) * .0054;
//    [self unschedule:@selector(updateAndCheckCollision)];
//    [self schedule:@selector(updateAndCheckCollision) interval:_interval];
}

- (BOOL) checkCollision {
    CGRect selfBoundingBox = [self boundingBox];
    CGRect girlBoundingBox = [_girl boundingBox];
    CGRect intersect = CGRectIntersection(selfBoundingBox, girlBoundingBox);
    if (!CGRectIsNull(intersect)) {
        NSLog(@"died");
        [self unschedule:@selector(updateAndCheckCollision)];
        [_communicator stopSchedules];
        return true;
    }
    return false;
}

- (void) endGame {
    CCScene *endScene = [CCBReader loadAsScene:@"EndScene"];
    [[CCDirector sharedDirector] replaceScene:endScene];
}

@end
