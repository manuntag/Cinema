//
//  MainCollectionViewController.m
//  Cinema
//
//  Created by David Manuntag on 2015-02-04.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//
#import "Movie.h"
#import "MainCollectionViewController.h"
#import "MovieCollectionViewCell.h"
#import "MovieViewController.h"


@interface MainCollectionViewController ()

@end

@implementation MainCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL * movieUrl = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=67wvyzu4w3kdywss4ewd9ryp&page_limit=10"];
    
    //NSData * jsonData = [NSData dataWithContentsOfURL:movieUrl];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:movieUrl completionHandler:^(NSData *jsonData, NSURLResponse *response, NSError *error) {
        
       
        NSError * jsonError = nil;
        
        NSDictionary * dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
        
        if (!dataDictionary) {
            NSLog(@"error decoding json %@, network error %@", jsonError, error);
            return;
        }
        
        self.movies = [NSMutableArray array];
        
        //array to hold dictionary objects
        
        NSArray * moviesArray = [dataDictionary objectForKey:@"movies"];
        
        // loop to access the items in the datadictionary
        //NSLog(@"in viewdidload moviesArray:%@", moviesArray);
        
        for (NSDictionary * movieDictionary in moviesArray) {
            
            Movie * movie = [[Movie alloc]initWithMovieTitle:[movieDictionary objectForKey:@"title"]];
            
            // movie ratings
            NSDictionary * ratingsDictionary = [movieDictionary objectForKey:@"ratings"];
            NSNumber * audienceRating = [ratingsDictionary objectForKey:@"audience_score"];
            
            NSString * audienceRatingString = [audienceRating stringValue];
            movie.audienceRating = audienceRatingString;
            NSString * criticsRating = [ratingsDictionary objectForKey:@"critics_rating"];
            movie.rating = criticsRating;
            
            //movie image
            NSDictionary * postersDictionary = [movieDictionary objectForKey:@"posters"];
            NSString * poster = [postersDictionary objectForKey:@"thumbnail"];
            
            NSString * hiResPoster = [poster stringByReplacingOccurrencesOfString:@"_tmb.jpg" withString:@"_det.jpg"];
            
            NSURL *imageUrl = [NSURL URLWithString:hiResPoster];
            NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
            movie.image = [UIImage imageWithData:imageData];
            
            //movie synopsis
            
            movie.synopsis = [movieDictionary objectForKey:@"synopsis"];
            
            //movie url
            NSDictionary * urlDictionary = [movieDictionary objectForKey:@"links"];
            movie.url = [NSURL URLWithString:[urlDictionary objectForKey:@"alternate"]];
            
            [self.movies addObject:movie];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
            
        }
    }];
    
    [dataTask resume];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
    
        MovieViewController * viewController = segue.destinationViewController;
        
        NSArray * indexPaths = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath * indexPath = [indexPaths objectAtIndex:0];
        
        Movie * movie = [self.movies objectAtIndex:indexPath.row];
        
        viewController.movie = movie;
        
    }
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.movies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Movie * movie = [self.movies objectAtIndex:indexPath.row];
    
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.imageView.image = movie.image;
    
    cell.movieTitle.text = movie.title;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
