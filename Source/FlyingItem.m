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
    [self schedule:@selector(moveup) interval:1];
    }
   return self;
}

-(void)moveup {
    self.position = ccp(self.position.x, self.position.y + 10);
}
@end
