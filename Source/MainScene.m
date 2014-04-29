//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Girl.h"



@implementation MainScene

- (id)init
{
    self = [super init];
    
    // activate touches on this scene
    self.userInteractionEnabled = TRUE;
    
    return self;
};

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CCLOG(@"Received a touch");
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    Girl.position = touchLocation;
}



@end
