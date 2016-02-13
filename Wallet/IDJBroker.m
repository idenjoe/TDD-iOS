//
//  IDJBroker.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJBroker.h"
#import "IDJMoney.h"

@interface IDJBroker ()

@end

@implementation IDJBroker

-(instancetype)init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    
    return self;
}

-(IDJMoney *)reduce:(id<IDJMoney>)money toCurrency:(NSString *)currency{
    // double dispatch
    return [money reduceToCurrency:currency withBroker:self];
}

-(void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency{
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    [self.rates setObject:[NSNumber numberWithFloat:1.0/rate] forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}

-(NSString *)keyFromCurrency:(NSString *)fromCurency
                  toCurrency:(NSString *)toCurrency {
    
    return [NSString stringWithFormat:@"%@-%@",fromCurency, toCurrency];
}

@end
