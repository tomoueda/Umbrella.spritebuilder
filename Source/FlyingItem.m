//
//  FlyingItem.m
//  Umbrella
//
//  Created by Logan Carter on 4/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "FlyingItem.h"
#import "Girl.h"

@implementation FlyingItem

- (id) init {
    self = [super init];
    if (self) {
        _collision = false;
        [self schedule:@selector(updateAndCheckCollision) interval:.006];
    }
   return self;
}

- (void) setGirl: (Girl *) girl {
    _girl = girl;
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

- (BOOL) checkCollision {
    CGRect selfBoundingBox = [self boundingBox];
    CGRect girlBoundingBox = [_girl boundingBox];
    CGRect intersect = CGRectIntersection(selfBoundingBox, girlBoundingBox);
    if (!CGRectIsNull(intersect)) {
        return true;
    }
    return false;
}

- (void) endGame {
    CCScene *endScene = [CCBReader loadAsScene:@"EndScene"];
    [[CCDirector sharedDirector] replaceScene:endScene];
}

@end
