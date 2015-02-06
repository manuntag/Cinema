//
//  Theatres.h
//  Cinema
//
//  Created by David Manuntag on 2015-02-05.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Theatres : NSObject

@property (nonatomic, strong) NSString * theatreName;
@property (nonatomic, strong) NSNumber * latitude;
@property (nonatomic, strong) NSNumber * longitude;


-(void)setUpAPI:(NSString*)comepleteSearchEntry;

-(instancetype)initWithTheatreTitle:(NSString*)theatreName  latitude:(NSNumber*)latitude longitude:(NSNumber*)longitude;

@end
