//
//  IDJMoney.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "IDJMoney-Private.h"

@implementation IDJMoney

+(id)euroWithAmount:(NSInteger)amount{
    return [[IDJMoney alloc] initWithAmount:amount currency:@"EUR"];
}

+(id)dollarWithAmount:(NSInteger)amount{
    return [[IDJMoney alloc] initWithAmount:amount currency:@"USD"];
}

-(id)initWithAmount:(NSUInteger)amount
           currency:(NSString *)currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    
    return self;
}

-(id)times:(NSUInteger)times{
    IDJMoney *newDollar = [[IDJMoney alloc] initWithAmount:self.amount.integerValue * times currency:self.currency];
    
    return newDollar;
}

- (BOOL)isEqual:(id)other
{
    if ([self.currency isEqual:[other currency]]) {
        return [self amount] == [other amount];
    }else{
        return NO;
    }
}

-(IDJMoney *)plus:(IDJMoney *)other{
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    IDJMoney *total = [[IDJMoney alloc] initWithAmount:totalAmount currency:self.currency];
    return total;
}

-(NSUInteger)hash{
    return (NSUInteger)self.amount;
}

#pragma mark - Overriden

-(NSString *)description{
    return [NSString stringWithFormat:@"<%@ %ld>",[self class],(long)[self amount]];
}

@end
