//
//  CatPictureCollectionViewCell.h
//  Cats
//
//  Created by Will Chew on 2018-06-21.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatPictureCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *catImage;
@property (weak, nonatomic) IBOutlet UILabel *catTitle;

@end
