//
//  EndScene.m
//  Umbrella
//
//  Created by Tomo Ueda on 4/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "EndScene.h"
#import "CCTextureCache.h"

@implementation EndScene

- (void)didLoadFromCCB {
    flipped = false;
    _sadgirl = [[CCSprite alloc] init];
    _sadgirl.position = ccp(180, 350);
    NSLog(@"%f, %f", [self boundingBox].size.width/2, [self boundingBox].size.height/2);
    CCTexture* tex = [[CCTextureCache sharedTextureCache] addImage:@"umbrellasad.png"];
    [_sadgirl setTexture:tex];
    [_sadgirl setTextureRect:CGRectMake(0, 0, tex.contentSize.width, tex.contentSize.height)];
    [self addChild:_sadgirl];
    NSLog(@"child added");
    [self schedule:@selector(changeImage) interval:2.0f];
}

-(void) retry {
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:mainScene];
}

-(void) changeImage {
    flipped = !flipped;
    if (flipped) {
        CCTexture* tex = [[CCTextureCache sharedTextureCache] addImage:@"umbrellasadflipped.png"];
        [_sadgirl setTexture:tex];
        [_sadgirl setTextureRect:CGRectMake(0, 0, tex.contentSize.width, tex.contentSize.height)];
    } else {
        CCTexture* tex = [[CCTextureCache sharedTextureCache] addImage:@"umbrellasad.png"];
        [_sadgirl setTexture:tex];
        [_sadgirl setTextureRect:CGRectMake(0, 0, tex.contentSize.width, tex.contentSize.height)];
    }
}

@end
