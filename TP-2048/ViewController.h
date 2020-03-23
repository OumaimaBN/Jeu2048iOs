//
//  ViewController.h
//  TP-2048
//
//  Created by  admin on 03/03/2020.
//  Copyright © 2020 Ecole d'ingenieur (Imagine). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameCell.h"

@interface ViewController : UIViewController
<UICollectionViewDataSource,UICollectionViewDelegate>{
    
    int espacementCellules;
    GameCell* cells[4][4];
    GameCell* AncienCells[4][4];
    int Totale;
    int lastTotale;
    int MeilleurScore;


 
}
@property (nonatomic,weak) IBOutlet UICollectionView* c;
@property (nonatomic,weak) IBOutlet UITextField* score;
@property (nonatomic,weak) IBOutlet UITextField* meilleur;
@property (nonatomic,weak) IBOutlet UIButton* Jouer;
@property (nonatomic,weak) IBOutlet UIButton* Rejouer;
@property (nonatomic,weak) IBOutlet UIButton* Anuuler;
-(IBAction) remplir;
-(IBAction) jouer;
-(IBAction) rejouer;
-(IBAction) annuler;
-(void) setTotale:(int)t;
-(int) Totale;
-(void) setlastTotale:(int)t;
-(int) lastTotale;
-(void) setMeilleurScore:(int)m;
-(int) MeilleureScore;
-(void) updateTotale:(int)t;

-(void) mouvement:( UISwipeGestureRecognizer*) r ;


-(void) addCells;


-(void) versHaut;
-(void) versBas;
-(void) versGauche;
-(void) versDroite;
-(int) CaseVide;
-(int) additionneDroite;
-(int) additionneGauche;
-(int) additionneHaut;
-(int) additionneBas;
@end



