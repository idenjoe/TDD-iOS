//
//  IDJDollar.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJDollar.h"

@interface IDJDollar ()

@property(nonatomic) NSInteger amount;

@end


@implementation IDJDollar

-(id)initWithAmount:(NSUInteger)amount{
    if (self = [super init]) {
        self.amount = amount;
    }
    
    return self;
}

-(IDJDollar *)times:(NSUInteger)times{
    IDJDollar *newDollar = [[IDJDollar alloc] initWithAmount:self.amount * times];
    
    return newDollar;
}

-(BOOL)isEqual:(id)object{
    return [self amount] == [object amount];
}

@end
