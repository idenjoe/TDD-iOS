//
//  IDJWallet.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJWallet.h"

@interface IDJWallet ()
@property(nonatomic, strong) NSMutableDictionary *moneys;
@end

@implementation IDJWallet

-(id)initWithAmount:(NSUInteger)amount currency:(NSString *)currency{
    if (self = [super init]) {
        IDJMoney *money = [[IDJMoney alloc] initWithAmount:amount currency:currency];
        _moneys = @{ currency : @[money].mutableCopy }.mutableCopy;
    }
    
    return self;
}

-(NSUInteger)countCurrencies{
    return [self.moneys count];
}

-(NSUInteger)moneyAtIndex:(NSUInteger)index{
    NSArray *currencies = [self.moneys allKeys];
    return [[self.moneys objectForKey:currencies] count];
}

-(id<IDJMoney>)plus:(IDJMoney *)other{
    NSMutableArray *money = [self.moneys objectForKey:other.currency];

    if (money == nil) {
        money = [NSMutableArray array];
    }

    [money addObject:other];
    [self.moneys setObject:money forKey:other.currency];
    return self;
}

-(id<IDJMoney>)times:(NSUInteger)times{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (NSString *currencyName in self.moneys.allKeys) {
        NSMutableArray *moneys = [self.moneys objectForKey:currencyName];
        for (IDJMoney *money in moneys) {
            IDJMoney *newMoney = [money times:times];
            [newMoneys addObject:newMoney];
        }
        
        [self.moneys setObject:newMoneys forKey:currencyName];
    }
    
    return self;
}

-(id<IDJMoney>)reduceToCurrency:(NSString *)currency
                     withBroker:(IDJBroker *)broker {
    
    IDJMoney *result = [[IDJMoney alloc] initWithAmount:0 currency:currency];
    for (NSString *currencyName in self.moneys.allKeys) {
        NSMutableArray *moneys = [self.moneys objectForKey:currencyName];
        for (IDJMoney *money in moneys) {
            result = [result plus:[money reduceToCurrency:currency withBroker:broker]];
        }
    }
    
    return result;
}

-(void)addMoney:(IDJMoney *)money{
    [self plus:money];
}

-(void)takeMoney:(IDJMoney *)money{
    
    NSMutableArray *moneyForCurrency = [self.moneys objectForKey:money.currency];
    
    int i = 0;
    for (IDJMoney *aMoney in moneyForCurrency) {
        if (money.amount.integerValue == aMoney.amount.integerValue) {
            [moneyForCurrency removeObject:money];
            break;
        }else if (money.amount.integerValue < aMoney.amount.integerValue){
            IDJMoney *newMoney = [[IDJMoney alloc] initWithAmount:aMoney.amount.integerValue-money.amount.integerValue
                                                         currency:money.currency];
            [moneyForCurrency replaceObjectAtIndex:i
                                   withObject:newMoney];
        }
        i++;
    }
    
    [self.moneys setObject:moneyForCurrency forKey:money.currency];
}

@end
