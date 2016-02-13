//
//  IDJWallet.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJWallet.h"

@interface IDJWallet ()
@property(nonatomic, strong) NSMutableArray *moneys;
@end

@implementation IDJWallet

-(id)initWithAmount:(NSUInteger)amount currency:(NSString *)currency{
    if (self = [super init]) {
        IDJMoney *money = [[IDJMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray arrayWithObject:money];
    }
    
    return self;
}

-(id<IDJMoney>)plus:(IDJMoney *)other{
    [self.moneys addObject:other];
    return self;
}

-(id<IDJMoney>)times:(NSUInteger)times{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (IDJMoney *money in self.moneys) {
        IDJMoney *newMoney = [money times:times];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

-(id<IDJMoney>)reduceToCurrency:(NSString *)currency
                     withBroker:(IDJBroker *)broker {
    
    IDJMoney *result = [[IDJMoney alloc] initWithAmount:0 currency:currency];
    for (IDJMoney *money in self.moneys) {
        result = [result plus:[money reduceToCurrency:currency withBroker:broker]];
    }
    
    return result;
}

@end
