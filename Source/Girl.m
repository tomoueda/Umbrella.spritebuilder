//
//  Girl.m
//  Umbrella
//
//  Created by Joel Terry on 4/29/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Girl.h"

@implementation Girl
    

- (void)didLoadFromCCB
{
    CCLOG(@"GIRL LOADED");
}

- (void)update:(CCTime)delta
{
    if (self.move && self.position.x != self.cursor.x)
    {
        float xChange;
        if (self.position.x < self.cursor.x) xChange = 10.0f; else xChange = -10.0f;
        self.position = ccpAdd(self.position, CGPointMake(xChange, 0.0f));
    }
}


@end
