//
//  IDJWallet.h
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDJMoney.h"

@interface IDJWallet : NSObject<IDJMoney>
@property (nonatomic, readonly) NSUInteger countCurrencies;

-(void)addMoney:(IDJMoney *)money;
-(void)takeMoney:(IDJMoney *)money;
-(NSUInteger)moneyAtIndex:(NSUInteger)index;

@end
