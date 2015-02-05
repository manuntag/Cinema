//
//  Movie.m
//  Cinema
//
//  Created by David Manuntag on 2015-02-04.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(instancetype)initWithMovieTitle:(NSString*)movietitle {
    
    if (self=[super init]) {
        
        self.title = movietitle;
    }

    return self;
    
}

@end
