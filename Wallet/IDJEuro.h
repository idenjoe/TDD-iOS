//
//  IDJEuro.h
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 02/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDJEuro : NSObject

-(id)initWithAmount:(NSUInteger)amount;
-(IDJEuro *)times:(NSInteger)times;

@end
