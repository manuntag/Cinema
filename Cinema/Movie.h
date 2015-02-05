//
//  Movie.h
//  Cinema
//
//  Created by David Manuntag on 2015-02-04.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Movie : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * rating;
@property (nonatomic, strong) NSString * audienceRating;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, strong) NSString * synopsis;
@property (nonatomic,strong)  NSURL * url;



-(instancetype)initWithMovieTitle:(NSString*)movietitle;




@end
