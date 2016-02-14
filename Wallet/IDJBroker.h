//
//  IDJBroker.h
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDJMoney.h"

@interface IDJBroker : NSObject
@property (nonatomic, strong) NSMutableDictionary *rates;

+(IDJBroker *)sharedInstance;
-(IDJMoney *)reduce:(id<IDJMoney>)money toCurrency:(NSString *)currency;
-(void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;
-(NSString *)keyFromCurrency:(NSString *)fromCurency
                  toCurrency:(NSString *)toCurrency;
@end
