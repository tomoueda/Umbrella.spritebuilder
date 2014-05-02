//
//  ImageDictionary.m
//  Umbrella
//
//  Created by Tomo Ueda on 5/1/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "ImageDictionary.h"

@implementation ImageDictionary


- (id) init {
    self = [super init];
    if (self) {
        images = [[NSMutableDictionary alloc] init];
        [images setObject:@"bleach.png" forKey:@"0"];
        [images setObject:@"cat.png" forKey:@"1"];
        [images setObject:@"bucket.png" forKey:@"2"];
        [images setObject:@"sponge.png" forKey:@"3"];
        [images setObject:@"cloud.png" forKey:@"4"];
    }
    return self;
}

- (NSString*) randomImage {
    int low = 0;
    int high = 5;
    int rnd = low + arc4random() % (high - low);
    if (rnd == 0) {
        return [images objectForKey:@"0"];
    } else if (rnd == 1) {
        return [images objectForKey:@"1"];
    } else if (rnd == 2) {
        return [images objectForKey:@"2"];
    } else if (rnd == 3) {
        return [images objectForKey:@"3"];
    } else {
        return [images objectForKey:@"4"];
    }
}

@end
