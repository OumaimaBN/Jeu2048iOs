//
//  ViewController.m
//  TP-2048
//
//  Created by  admin on 03/03/2020.
//  Copyright © 2020 Ecole d'ingenieur (Imagine). All rights reserved.
//

#import "ViewController.h"
#import "GameCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [_Jouer setHidden:false];
    [_Rejouer setHidden:true];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self c].delegate = self ;
    [self c].dataSource = self ;
    espacementCellules = 10;
    Totale=0;
    lastTotale=0;
    UICollectionViewFlowLayout* layout = [[ UICollectionViewFlowLayout alloc ] init ];
    layout.sectionInset = UIEdgeInsetsMake(0, (CGFloat)espacementCellules , 0, (CGFloat) espacementCellules ) ;
    layout.minimumLineSpacing = (CGFloat) espacementCellules ; [[self c] setCollectionViewLayout:layout];
    for(int i = 0 ; i < 4; i++)
    {
        for(int j=0; j<4; j++){
        cells[i][j] = [[self c] dequeueReusableCellWithReuseIdentifier:@"cell2048"
                                                     forIndexPath : [ NSIndexPath indexPathForRow : i inSection : j ] ] ;
        [ cells[i][j] setValeur :0];
        AncienCells[i][j] = [[self c] dequeueReusableCellWithReuseIdentifier:@"cell2048"
                                                         forIndexPath : [ NSIndexPath indexPathForRow : i inSection : j ] ] ;
            [ AncienCells[i][j] setValeur :0];
            
        }
     }
    [ self c ].backgroundColor = UIColor.darkGrayColor ;
    UISwipeGestureRecognizer *haut= [[ UISwipeGestureRecognizer alloc ] initWithTarget:self action:@selector(mouvement:) ];
    [haut setDirection:(UISwipeGestureRecognizerDirectionUp)];
    UISwipeGestureRecognizer *bas = [[ UISwipeGestureRecognizer alloc ] initWithTarget : self action :@selector(mouvement:) ];
    [bas setDirection:(UISwipeGestureRecognizerDirectionDown)];
    UISwipeGestureRecognizer *gauche= [[ UISwipeGestureRecognizer alloc ] initWithTarget : self
    action :@selector(mouvement:) ];
    [gauche setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    UISwipeGestureRecognizer *droite = [[ UISwipeGestureRecognizer alloc ] initWithTarget : self action :@selector(mouvement:) ];
    [droite setDirection :( UISwipeGestureRecognizerDirectionRight) ];
    
    [[self view]addGestureRecognizer : haut ] ;
    [[self view]addGestureRecognizer : bas ] ;
    [[self view]addGestureRecognizer : gauche ] ;
    [[self view]addGestureRecognizer : droite ] ;
    if([self MeilleureScore]==2048){
        NSLog(@"gagné");
    }
 
}

-(void)setTotale:(int)t{
    self->Totale=t;
}
-(void)updateTotale:(int)t{
    self->Totale+=t;
    
}

-(void)setlastTotale:(int)t{
    self->lastTotale=t;
}

-(int) lastTotale{
    return self->lastTotale;
}
-(int) Totale{
    return self->Totale;
}
-(void)setMeilleurScore:(int)m{
    self->MeilleurScore=m;
}
-(int)MeilleureScore{
    return self->MeilleurScore;
}
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4 ;
  }
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:( NSInteger ) section
{
    return 4 ;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                cellForItemAtIndexPath : (NSIndexPath *) indexPath
{
    [cells[[indexPath row]][[indexPath section]] dessineCellule];
    return cells[[indexPath row]][[indexPath section]];
}

-(CGSize) collectionView :( UICollectionView *) collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath : ( NSIndexPath *) indexPath {
    return CGSizeMake(([self c].frame.size.width - (CGFloat)espacementCellules * 5) / (CGFloat)4, ([self c].frame.size.height - (CGFloat)espacementCellules * 5) / ( CGFloat) 4) ;
}

-(CGSize) collectionView :( UICollectionView *) collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0 , (CGFloat) espacementCellules ) ;
}
-(IBAction)annuler{
   
          for (int i=0;i<4; i++) {
              for (int j=0; j<4; j++) {
                  [cells[i][j] setValeur:[AncienCells[i][j] valeur] ];
                   [cells[i][j] dessineCellule ];
              }
          }

     [_score setText:[NSString stringWithFormat: @"%d", [self lastTotale]]];
}


-(void) mouvement:( UISwipeGestureRecognizer*) r {
    [_score setText:[NSString stringWithFormat: @"%d", Totale]];
  
    for (int i=0;i<4; i++) {
           for (int j=0; j<4; j++) {
               [AncienCells[i][j] setValeur:[cells[i][j] valeur] ];
           }
    }
    [self setlastTotale:[self Totale]];
    switch ( r.direction ){
            
        case UISwipeGestureRecognizerDirectionLeft :
            NSLog(@"A gauche") ;
            [self versGauche];
            [self updateTotale:[self additionneGauche]];
            [self versGauche];
            [self addCells];
            

            break ;
        case UISwipeGestureRecognizerDirectionRight :
            NSLog (@"A droite " ) ;
            [self versDroite];
            [self updateTotale:[self additionneDroite]];
            [self versDroite];
            [self addCells];
            
            break ;
        case UISwipeGestureRecognizerDirectionUp :
            NSLog(@"En haut") ;
            [self versHaut];
            [self updateTotale:[self additionneHaut]] ;
            [self versHaut];
            [self addCells];
          
         
            break ;
        case UISwipeGestureRecognizerDirectionDown :
            NSLog(@"En bas") ;
            [self versBas];
            [self updateTotale:[self additionneBas]];
            [self versBas];
            [self addCells];
      
            break ;
            
    }
}
-(int) CaseVide{
    int n=0;
    for(int i=0;i<4;i++){
        for(int j=0;j<4;j++){
            if([cells[i][j] valeur]==0){
                n=n+1;
            }
        }
    }
    return n;
}
-(void) addCells{
    int i,j;
    int n=[self CaseVide];
    if(n!=0){
        do{
            i=arc4random_uniform(4);
            j=arc4random_uniform(4);
        }while([cells[i][j] valeur]!=0);
        [cells[i][j] setValeur: 2];
        [cells[i][j] dessineCellule ];
        
    }
    else{
        NSLog(@"u lost");
      
    }
    
}
-(void) removeCells:c{
    [c setValeur: 0];
    [c dessineCellule ];
}
-(IBAction ) remplir {
    [self addCells];
    [self addCells];
    [[self c] reloadData];
}
-(IBAction ) jouer {
    [self remplir];
    [self setTotale:0];
    [_Rejouer setHidden:false];
    [_Jouer setHidden:true];
    [_meilleur setText:[NSString stringWithFormat: @"%d",0]];
}
-(IBAction ) rejouer{
    int i,j;
    for(i=0;i<4;i++){
        for(j=0;j<4;j++){
         
                    [cells[i][j] setValeur:0];
                    [ cells[i][j] dessineCellule ];
        }
    }
    if( [self Totale] > [self MeilleureScore]){
        [self setMeilleurScore:Totale];
        [_meilleur setText:[NSString stringWithFormat: @"%d",[self MeilleureScore]]];
    }
    [[self c] reloadData];
    [self setTotale:0];
    [_score setText:[NSString stringWithFormat: @"%d", 0]];
    [self remplir];

}
-(void)versBas{
    int i,j,k;
    for(i=0;i<4;i++){
        k=3;
        for(j=3;j>=0;j--){
            
            if([cells[i][j] valeur]!=0){
                [cells[i][k] setValeur:[cells[i][j] valeur]];
                [ cells[i][k] dessineCellule ];
                if(k>j){
                    [cells[i][j] setValeur:0];
                    [ cells[i][j] dessineCellule ];
                }
                k--;
            }
        }
    }
    [[self c] reloadData];
}
-(void)versHaut{
    int i,j,k=0;
    for(i=0;i<4;i++){
        k=0;
        for(j=0;j<4;j++){
            
            if([cells[i][j] valeur]!= 0){
                [cells[i][k] setValeur:[cells[i][j] valeur]];
                [cells[i][k] dessineCellule ];
                if(k<j){
                    [cells[i][j] setValeur:0];
                    [cells[i][j] dessineCellule ];
                }
                k++;
            }
        }
    }
    [[self c] reloadData];
}
-(void)versGauche{
    int i,j,k;
    for(j=0;j<4;j++){
        k=0;
        for(i=0;i<4;i++){
            if([cells[i][j] valeur]!=0){
                [cells[k][j] setValeur:[cells[i][j] valeur]];
                [ cells[k][j] dessineCellule ];
                if(k<i){
                    [cells[i][j] setValeur:0];
                    [ cells[i][j] dessineCellule ];
                    
                }
                k++;
            }
        }
    }
    [[self c] reloadData];
}
-(void)versDroite{
    int i,j,k;
    for(j=0;j<4;j++){
        k=3;
        for(i=3;i>=0;i--){
            if([cells[i][j] valeur]!=0){
                [cells[k][j] setValeur:[cells[i][j] valeur]];
                [cells[k][j] dessineCellule ];
                if(k>i){
                    [cells[i][j] setValeur:0];
                    [ cells[i][j] dessineCellule ];
                }
                k--;
            }
        }
    }
    [[self c] reloadData];
}
-(int)additionneDroite{
 int i,j,score=0;
    for(i=3;i>0;i--){
        for(j=0;j<4;j++){
            if([cells[i][j] valeur]==[cells[i-1][j] valeur]){
                [cells[i][j] setValeur:[cells[i][j] valeur]+[cells[i-1][j] valeur]];
                [cells[i][j] dessineCellule ];
                score+=[cells[i][j] valeur];
                [cells[i-1][j] setValeur:0];
                [cells[i-1][j] dessineCellule ];
            }
        }
    }
    return score;
}
-(int)additionneBas{
    int i,j,score=0;
     for(i=0;i<4;i++){
         for(j=3;j>0;j--){
             if([cells[i][j] valeur]==[cells[i][j-1] valeur]){
                 [cells[i][j] setValeur:[cells[i][j] valeur]+[cells[i][j-1] valeur]];
                 [ cells[i][j] dessineCellule ];
                 score+=[cells[i][j] valeur];
                 [cells[i][j-1] setValeur:0];
                 [ cells[i][j-1] dessineCellule ];
             }
         }
     }
     return score;
}
-(int)additionneHaut{
  int i,j,score=0;
    for(i=0;i<4;i++){
        for(j=0;j<3;j++){
            if([cells[i][j] valeur]==[cells[i][j+1] valeur]){
                [cells[i][j] setValeur:[cells[i][j] valeur]+[cells[i][j+1] valeur]];
                [cells[i][j] dessineCellule ];
                score+=[cells[i][j] valeur];
                [cells[i][j+1] setValeur:0];
                [cells[i][j+1] dessineCellule ];
            }
        }
    }
    return score;
}

-(int)additionneGauche{
    int i,j,score=0;
      for(i=0;i<3;i++){
          for(j=0;j<4;j++){
              if([cells[i][j] valeur]==[cells[i+1][j] valeur]){
                  [cells[i][j] setValeur:[cells[i][j] valeur]+[cells[i+1][j] valeur]];
                  [cells[i][j] dessineCellule ];
                  score+=[cells[i][j] valeur];
                  
                  [cells[i+1][j] setValeur:0];
                  [cells[i+1][j] dessineCellule ];
              }
          }
      }
      return score; 
}
@end
