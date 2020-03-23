//
//  GameCell.h
//  TP-2048
//
//  Created by  admin on 03/03/2020.
//  Copyright © 2020 Ecole d'ingenieur (Imagine). All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameCell : UICollectionViewCell{
    int Valeur;
    BOOL deplace;
}

@property (nonatomic,weak) IBOutlet UILabel* l;
 
-(void) setValeur : (int) valeur;
-( id ) initWithCoder : ( NSCoder *) aDecoder;
-( id ) initWithFrame : ( CGRect) frame;
-(void) dessineCellule ;
-(int) valeur;
@end

NS_ASSUME_NONNULL_END
