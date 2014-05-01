//
//  FlyingItem.h
//  Umbrella
//
//  Created by Logan Carter on 4/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"
#import "Girl.h"

@interface FlyingItem : CCSprite
{
    Girl* _girl;
    BOOL _collision;
}

- (void) setGirl: (Girl*) girl;
- (void) moveup;

@end