//
//  IDJWallet.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJWallet.h"
#import "IDJBroker.h"

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

-(NSUInteger)countMoneyAtIndex:(NSUInteger)index{
    NSArray *currencies = [self.moneys allKeys];
    if (index > [currencies count]-1) {
        return 0;
    }
    
    NSString *currency = [currencies objectAtIndex:index];
    return [[self.moneys objectForKey:currency] count];
}

-(IDJMoney *)moneyAtSection:(NSInteger)section andRow:(NSInteger)row{
    NSUInteger countMoneys = [self countMoneyAtIndex:section];
    NSUInteger countCurrencies = [self countCurrencies];
    if (section > countCurrencies-1) {
        return [self totalAmountForAllCurrencies];
    }else{
        if (row > countMoneys-1) {
            NSString *currencyAtSection = [[self.moneys allKeys] objectAtIndex:section];
            return [self totalAmountForCurrency:currencyAtSection];
        }else{
            return [self moneyForSection:section andRow:row];
        }
    }
}

-(IDJMoney *)totalAmountForCurrency:(NSString *)currency{
    NSArray *moneyForCurrency = [self.moneys objectForKey:currency];
    IDJMoney *totalMoney = [[IDJMoney alloc] initWithAmount:0 currency:currency];
    for (IDJMoney *money in moneyForCurrency) {
        totalMoney = [totalMoney plus:money];
    }
    return [totalMoney reduceToCurrency:@"EUR" withBroker:[IDJBroker sharedInstance]];
}

-(IDJMoney *)totalAmountForAllCurrencies{
    return [self reduceToCurrency:@"EUR" withBroker:[IDJBroker sharedInstance]];
}

-(NSString *)currencyAtIndex:(NSInteger)section{
    NSArray *currencies = [self.moneys allKeys];
    if (section > [currencies count]-1) {
        return @"Total";
    }else{
        return [currencies objectAtIndex:section];
    }
}

-(IDJMoney *)moneyForSection:(NSInteger)section andRow:(NSInteger)row{
    NSArray *currencies = [self.moneys allKeys];
    NSString *desiredCurrency = [currencies objectAtIndex:section];
    return [[self.moneys objectForKey:desiredCurrency] objectAtIndex:row];
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
