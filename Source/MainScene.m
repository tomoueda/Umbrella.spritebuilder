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
}
-(void)didLoadFromCCB {
    _flyitem = (FlyingItem*) [CCBReader load:@"FlyingItem"];
    _flyitem.position = ccp(147, 209);
    [self addChild:_flyitem];
}
@end
