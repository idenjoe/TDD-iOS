//
//  IDJMoney.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJMoney.h"
#import "NSObject+GNUStepAddons.h"

@interface IDJMoney ()

@property(nonatomic) NSInteger amount;

@end

@implementation IDJMoney

-(id)initWithAmount:(NSUInteger)amount{
    if (self = [super init]) {
        _amount = amount;
    }
    
    return self;
}

-(IDJMoney *)times:(NSUInteger)times{
    // It shouldn't be called, but should use the subclass one
    return [self subclassResponsability:_cmd];
}

#pragma mark - Overriden

-(NSString *)description{
    return [NSString stringWithFormat:@"<%@ %ld",[self class],(long)[self amount]];
}

@end
