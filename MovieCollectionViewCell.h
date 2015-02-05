//
//  MovieCollectionViewCell.h
//  Cinema
//
//  Created by David Manuntag on 2015-02-04.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;

@end
