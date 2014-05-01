//
//  EndScene.m
//  Umbrella
//
//  Created by Tomo Ueda on 4/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "EndScene.h"

@implementation EndScene

-(void) retry {
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:mainScene];
}

@end
