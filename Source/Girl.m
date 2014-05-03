//
//  Girl.m
//  Umbrella
//
//  Created by Joel Terry on 4/29/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Girl.h"
#import "CCTextureCache.h"

@implementation Girl
    

- (void)didLoadFromCCB
{
    CCLOG(@"GIRL LOADED");
    [self changeImageRight];
}

- (void)update:(CCTime)delta
{
    if (self.move && self.position.x != self.cursor.x)
    {
        float xChange = 0.0f;
        if (self.position.x < self.cursor.x) {
            xChange = 2.0f;
            [self changeImageRight];
        } else if (self.position.x > self.cursor.x) {
            xChange = -2.0f;
            [self changeImageLeft];
        }
        self.position = ccpAdd(self.position, CGPointMake(xChange, 0.0f));
    }
}

- (void) changeImageRight {
    CCTexture* tex = [[CCTextureCache sharedTextureCache] addImage:@"umbrella.png"];
    [self setTexture:tex];
    [self setTextureRect:CGRectMake(0, 0, tex.contentSize.width, tex.contentSize.height)];
}

- (void) changeImageLeft {
    CCTexture* tex = [[CCTextureCache sharedTextureCache] addImage:@"umbrellaflipped.png"];
    [self setTexture:tex];
    [self setTextureRect:CGRectMake(0, 0, tex.contentSize.width, tex.contentSize.height)];
    
}


@end
