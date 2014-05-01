//
//  FlyingItem.h
//  Umbrella
//
//  Created by Logan Carter on 4/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface FlyingItem : CCSprite
{
    bool collision;
}

-(void)moveup;

@end