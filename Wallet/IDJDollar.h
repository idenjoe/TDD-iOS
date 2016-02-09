//
//  IDJDollar.h
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDJDollar : NSObject

-(id)initWithAmount:(NSUInteger)amount;
-(IDJDollar *)times:(NSUInteger)times;

@end
