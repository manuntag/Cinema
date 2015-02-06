//
//  Theatres.m
//  Cinema
//
//  Created by David Manuntag on 2015-02-05.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "Theatres.h"


@implementation Theatres


-(instancetype)initWithTheatreTitle:(NSString*)theatreName latitude:(NSNumber*)latitude longitude:(NSNumber*)longitude {
    
    if (self = [super init]) {
        
        _theatreName = theatreName;
        _latitude = latitude;
        _longitude = longitude;
        
    }
    return self;
}


//-(void)setUpAPI:(NSString*)comepleteSearchEntry {
//    
//    NSURL * movieTheatreUrl = [NSURL URLWithString:comepleteSearchEntry];
//    
//    NSData * jsonData = [NSData dataWithContentsOfURL:movieTheatreUrl];
//    
//    NSError * error = nil;
//    
//    NSDictionary * dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//
//    self.theatresArray = [NSMutableArray array];
//    
//    NSArray * theatresArray = [dataDictionary objectForKey:@"theatres"];
//    
//    for (NSDictionary * theatreDictionary in theatresArray) {
//        
//    Theatres * theatre = [[Theatres alloc]initWithTheatreTitle:[theatreDictionary objectForKey:@"name"] latitude:[theatreDictionary objectForKey:@"lat"] longitude:[theatreDictionary objectForKey:@"lng"]];
//        
//    [self.theatresArray addObject:theatre];
//        
//        
//    }
//    
//    }

    








@end
