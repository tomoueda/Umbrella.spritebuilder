//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Girl.h"



@implementation MainScene {
    Girl *_girl;
}

- (void)didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    _girl = (Girl*) [CCBReader load:@"Girl"];
    _girl.position = ccp(175, 500);
    [self addChild:_girl];
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


@end
