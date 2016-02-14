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
//Supposing that you can only takeMoney from the same currency, if not you should reduce every money and check if you can take enoght money from it.
-(void)takeMoney:(IDJMoney *)money;
-(NSUInteger)countMoneyAtIndex:(NSUInteger)index;
-(IDJMoney *)moneyAtSection:(NSInteger)section andRow:(NSInteger)row;
-(NSString *)currencyAtIndex:(NSInteger)section;

@end
