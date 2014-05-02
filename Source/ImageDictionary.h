//
//  ImageDictionary.h
//  Umbrella
//
//  Created by Tomo Ueda on 5/1/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDictionary : NSObject
{
    NSMutableDictionary* images;
}

- (NSString*) randomImage;


@end
