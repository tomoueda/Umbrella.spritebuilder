//
//  Score.h
//  Umbrella
//
//  Created by Tomo Ueda on 5/1/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCLabelTTF.h"

@interface Score : CCLabelTTF

@property (nonatomic, assign) int _score;

- (void) pointUp;

@end
