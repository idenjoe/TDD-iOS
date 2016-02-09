//
//  IDJEuro.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 02/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJEuro.h"

@interface IDJEuro ()

@property(nonatomic) NSInteger amount;

@end

@implementation IDJEuro

-(id)initWithAmount:(NSUInteger)amount{
    if (self = [super init]) {
        _amount = amount;
    }
    
    return self;
}

-(IDJEuro *)times:(NSInteger)times{
    IDJEuro *newEuro = [[IDJEuro alloc] initWithAmount:self.amount * times];
    return newEuro;
}

- (BOOL)isEqual:(id)other
{
    return [self amount] == [other amount];
}

-(NSUInteger)hash{
    return (NSUInteger)self.amount;
}

@end
