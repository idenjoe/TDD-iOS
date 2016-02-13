//
//  IDJBroker.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJBroker.h"
#import "IDJMoney.h"

@implementation IDJBroker

-(IDJMoney *)reduce:(IDJMoney *)money toCurrency:(NSString *)currency{
    return money;
}

@end
