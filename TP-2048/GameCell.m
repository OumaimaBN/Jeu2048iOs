//
//  GameCell.m
//  TP-2048
//
//  Created by  admin on 03/03/2020.
//  Copyright © 2020 Ecole d'ingenieur (Imagine). All rights reserved.
//

#import "GameCell.h"

@implementation GameCell

-(void) setValeur:(int)valeur{
    self->Valeur = valeur;
}
-( id ) initWithCoder:(NSCoder*) aDecoder {
    self = [super initWithCoder :aDecoder];
    [ self setValeur:0];
    deplace = FALSE;
    return self ;
    
}
-( id ) initWithFrame : ( CGRect) frame {
    self = [super initWithFrame:frame];
    [ self setValeur:0];
    deplace = FALSE;
    return self ;
    
}
-(int) valeur {
    return self->Valeur;
}
- (void) dessineCellule {
if ([ self valeur ] < 2048) {
    switch([self valeur]) {
        case 0:
            [[self l] setText:@""];
            [[self l] setBackgroundColor : UIColor.systemGray2Color ] ;
            break ;
        case 2:
            [[self l] setText : [ NSString stringWithFormat:@"%d",[self valeur]]];
            [[self l] setBackgroundColor : UIColor.systemIndigoColor ] ;
            break ;
        case 4:
            [[self l] setText : [ NSString stringWithFormat:@"%d",[self valeur]]];
            [[self l] setBackgroundColor : UIColor.cyanColor ] ;
            break ;
        case 8:
            [[self l] setText : [ NSString stringWithFormat:@"%d",[self valeur]]];
            [[self l] setBackgroundColor : UIColor.magentaColor ] ;
            break ;
        case 16:
            [[self l] setText : [ NSString stringWithFormat:@"%d",[self valeur]]];
            [[self l] setBackgroundColor : UIColor.systemPurpleColor ] ;
            break ;
        case 32:
            [[self l] setText : [ NSString stringWithFormat:@"%d",[self valeur]]];
            [[self l] setBackgroundColor : UIColor.systemTealColor ] ;
            break ;
        case 64:
            [[self l] setText : [ NSString stringWithFormat:@"%d",[self valeur]]];
            [[self l] setBackgroundColor : UIColor.orangeColor ] ;
            break ;
        case 128:
            [[self l] setText : [ NSString stringWithFormat:@"%d",[self valeur]]];
            [[self l] setBackgroundColor : UIColor.cyanColor ] ;
            break ;
        case 256:
            [[self l] setText : [ NSString stringWithFormat :@"%d" ,[self valeur]]];
            [[self l] setBackgroundColor : UIColor.yellowColor] ;
            break ;
        case 512:
            [[self l] setText : [ NSString stringWithFormat:@"%d",[self valeur]]];
            [[self l] setBackgroundColor : UIColor.purpleColor ] ;
            break ;
        case 1024:
            [[self l] setText : [ NSString stringWithFormat :@"%d" ,[self valeur]]];
            [[self l] setBackgroundColor : UIColor.brownColor] ;
            break;
    }
}
else{
    [[self l] setText : [ NSString stringWithFormat :@"%d" ,[self valeur]]];
    [[self l] setBackgroundColor : UIColor.redColor] ;
}
}
                   
       
            
            
           

@end
