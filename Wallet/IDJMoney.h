//
//  IDJMoney.h
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDJMoney : NSObject

-(id)initWithAmount:(NSUInteger)amount;
-(IDJMoney *)times:(NSUInteger)times;

@end
