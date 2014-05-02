//
//  FlyingItem.h
//  Umbrella
//
//  Created by Logan Carter on 4/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"
#import "Communicator.h"
#import "Score.h"
#import "Girl.h"

@interface FlyingItem : CCSprite
{
    Girl* _girl;
    Score* _score;
    Communicator* _communicator;
    BOOL _collision;
    float _interval;
}

- (void) setGirl: (Girl*) girl;
- (void) setCommunicator: (Communicator*) communicator;
- (void) setScore: (Score*) score;
- (void) moveup;

@end