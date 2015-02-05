//
//  MovieViewController.m
//  Cinema
//
//  Created by David Manuntag on 2015-02-04.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"

#import "WebViewController.h"

@interface MovieViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *movieImage;
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *criticsRating;
@property (strong, nonatomic) IBOutlet UILabel *audienceRating;

@property (strong, nonatomic) IBOutlet UITextView *movieSynopsis;

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieImage.image = self.movie.image;
    self.movieTitle.text = self.movie.title;
    self.movieSynopsis.text = self.movie.synopsis;
    self.criticsRating.text = [NSString stringWithFormat:@"Critics Rating\n%@",self.movie.rating];
    self.audienceRating.text = [NSString stringWithFormat:@"Audience Rating\n%@%%", self.movie.audienceRating];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
    if ([segue.identifier isEqualToString:@"webSegue"]) {
       
//        WebViewController * viewcontroller = segue.destinationViewController;
       
        [segue.destinationViewController setMobileURL:self.movie.url];
    
    
    }
    
    
    
}


@end
