//
//  IDJMonetTests.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDJMoney.h"

@interface IDJMoneyTests : XCTestCase

@end

@implementation IDJMoneyTests

-(void) testCurrency{
    XCTAssertEqualObjects(@"EUR", [[IDJMoney euroWithAmount:2] currency],@"The currency of euros should be EUR");
    XCTAssertEqualObjects(@"USD", [[IDJMoney dollarWithAmount:2] currency],@"The currency of dollars should be USD");
}

@end
