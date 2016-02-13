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
@property (nonatomic, strong) NSMutableDictionary *rates;
@end

@implementation IDJBroker

-(instancetype)init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    
    return self;
}

-(IDJMoney *)reduce:(IDJMoney *)money toCurrency:(NSString *)currency{
    
    IDJMoney *result;
    float rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency toCurrency:currency]] floatValue];
    if ([money.currency isEqual:currency]) {
        result = money;
    }else if (rate == 0){
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %2",money.currency, currency];
    }else{
        NSString *currencyKey = [self keyFromCurrency:money.currency toCurrency:currency];
        NSInteger newAmount = money.amount.integerValue * rate;
        
        result = [[IDJMoney alloc] initWithAmount:newAmount currency:currency];
    }
    
    return result;
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
