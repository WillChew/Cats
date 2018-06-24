//
//  ViewController.m
//  Cats
//
//  Created by Will Chew on 2018-06-21.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "CatPictureCollectionViewCell.h"
#import "Photo.h"

@interface ViewController () <UICollectionViewDataSource>
@property (nonatomic,strong) NSArray *catArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NetworkManager fetchPictures:^(NSArray<Photo*>*catArray) {
        self.catArray = catArray;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   return self.catArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CatPictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CatCell" forIndexPath:indexPath];
    
    

    Photo *photo = self.catArray[indexPath.item];
   
    NSData *data = [NSData dataWithContentsOfURL:photo.pictureURL];
    UIImage *catPicture = [UIImage imageWithData:data];
    
    cell.catImage.image = catPicture;
    
    
    return cell;
}


@end
