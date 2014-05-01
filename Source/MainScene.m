//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "FlyingItem.h"
#import "Girl.h"

@implementation MainScene {
    Girl *_girl;
    FlyingItem* _flyitem;
    FlyingItem* _flyitem2;
}

- (void)didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    _girl = (Girl*) [CCBReader load:@"Girl"];
    _girl.position = ccp(175, 500);
    [self addChild:_girl];
    _flyitem = (FlyingItem*) [CCBReader load:@"FlyingItem"];
    int r = arc4random() % 326;
    _flyitem.position = ccp(r, 0);
    [self addChild:_flyitem];
    [self performSelector:@selector(AddAnother) withObject:nil afterDelay:1.6];
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInNode:self];
    _girl.move = TRUE;
    _girl.cursor = touchLocation;
    
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    _girl.cursor = touchLocation;
}

-(void) touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    _girl.move = FALSE;
}

-(void) touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    _girl.move = FALSE;
}

-(void)AddAnother {
    int r2 = arc4random() % 326;
    _flyitem2 = (FlyingItem*) [CCBReader load:@"FlyingItem"];
    _flyitem2.position = ccp(r2, 0);
    [self addChild:_flyitem2];
}

@end
