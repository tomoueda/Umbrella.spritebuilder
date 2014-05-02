//
//  Score.m
//  Umbrella
//
//  Created by Tomo Ueda on 5/1/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Score.h"

@implementation Score

@synthesize _score;

- (id) init {
    self = [super init];
    if (self) {
        _score = 0;
        [self setString:[@"Score: " stringByAppendingString:[NSString stringWithFormat:@"%i", _score]]];
        [self setPosition:ccp(100, 200)];
    }
    return self;
}

- (void) pointUp {
    NSLog(@"%i", _score);
    _score++;
    [self setString:[@"Score: " stringByAppendingString:[NSString stringWithFormat:@"%i", _score]]];
}

@end
