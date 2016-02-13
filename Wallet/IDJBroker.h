//
//  IDJBroker.h
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IDJMoney;

@interface IDJBroker : NSObject
-(IDJMoney *)reduce:(IDJMoney *)money toCurrency:(NSString *)currency;
-(void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;
@end
