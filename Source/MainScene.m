//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "FlyingItem.h"

@implementation MainScene {
    FlyingItem* _flyitem;
    FlyingItem* _flyitem2;
}
-(void)didLoadFromCCB {
    _flyitem = (FlyingItem*) [CCBReader load:@"FlyingItem"];
    int r = arc4random() % 326;
    _flyitem.position = ccp(r, 0);
    [self addChild:_flyitem];
[self performSelector:@selector(AddAnother) withObject:nil afterDelay:1.6];
}
-(void)AddAnother {
    int r2 = arc4random() % 326;
    _flyitem2 = (FlyingItem*) [CCBReader load:@"FlyingItem"];
    _flyitem2.position = ccp(r2, 0);
    [self addChild:_flyitem2];
}
@end
