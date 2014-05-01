//
//  FlyingItem.m
//  Umbrella
//
//  Created by Logan Carter on 4/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "FlyingItem.h"

@implementation FlyingItem
- (id)init {
    self = [super init];
    if (self) {
    [self schedule:@selector(moveup) interval:.006];
    }
   return self;
}

-(void)moveup {
    self.position = ccp(self.position.x, self.position.y + 1);
    if (self.position.y >= 566) {
        int r = arc4random() % 326;
        self.position = ccp(r, 0);
    }
}

@end
