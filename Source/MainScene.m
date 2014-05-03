//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "FlyingItem.h"
#import "Communicator.h"
#import "Score.h"
#import "Girl.h"

@implementation MainScene {
    Girl *_girl;
    Communicator* _communicator;
    Score* _score;
}

- (void)didLoadFromCCB {
    // tell this scene to accept touches
    _communicator = [[Communicator alloc] init];
    _score = [[Score alloc] init];
    [self addChild:_score];
    self.userInteractionEnabled = TRUE;
    _girl = (Girl*) [CCBReader load:@"Girl"];
    _girl.position = ccp(175, 450);
    [self addChild:_girl];
    [self performSelector:@selector(AddAnother) withObject:nil afterDelay:1.6];
    [self schedule:@selector(AddAnother) interval:3];
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
//    _flyitem2 = (FlyingItem*) [CCBReader load:@"FlyingItem"];
    FlyingItem* flyitem = (FlyingItem*) [CCBReader load:@"FlyingItem"];
    [flyitem changeImage];
    [flyitem setGirl:_girl];
    [flyitem setCommunicator:_communicator];
    [flyitem setScore:_score];
    flyitem.position = ccp(r2, 0);
    [self addChild:flyitem];
    
}


@end
