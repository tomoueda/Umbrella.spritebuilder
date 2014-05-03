//
//  FlyingItem.m
//  Umbrella
//
//  Created by Logan Carter on 4/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "FlyingItem.h"
#import "Communicator.h"
#import "CCTextureCache.h"
#import "Girl.h"
#import "Score.h"

#define ARC4RANDOM_MAX      0x100000000

@implementation FlyingItem

- (id) init {
    self = [super init];
    if (self) {
        _image = [[ImageDictionary alloc] init];
        [self changeImage];
        _collision = false;
        _interval = .006;
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

- (void) setScore: (Score*) score {
    _score = score;
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
            [_score pointUp];
            if (_score._score % 10 == 0) {
                [self speedUp];
                NSLog(@"speedup %f", _interval);
            }
            [self changeImage];
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
    float x = [_girl boundingBox].origin.x;
    float y = [_girl boundingBox].origin.y;
    float offsetx = [_girl boundingBox].size.width / 2;
    float offsety = [_girl boundingBox].size.height / 2;
    CGRect girlBoundingBox = CGRectMake(x + offsetx, y + offsety, 0, 0);
    CGRect intersect = CGRectIntersection(selfBoundingBox, girlBoundingBox);
    if (!CGRectIsNull(intersect)) {
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

- (void) speedUp {
    [self unschedule:@selector(updateAndCheckCollision)];
    if (_interval > .0006) {
        _interval -= .00077;
    }
    [self schedule:@selector(updateAndCheckCollision) interval:_interval];
}

- (void) changeImage {
    NSString* imageString = [_image randomImage];
    CCTexture* tex = [[CCTextureCache sharedTextureCache] addImage:imageString];
    [self setTexture:tex];
    [self setTextureRect:CGRectMake(0, 0, tex.contentSize.width, tex.contentSize.height)];
}

@end
