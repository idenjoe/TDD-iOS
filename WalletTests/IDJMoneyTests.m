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

-(void)testDifferentCurrencies{
    
    IDJMoney *euro = [IDJMoney euroWithAmount:1];
    IDJMoney *dollar = [IDJMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Euros and dollars should not be equal!");
}

-(void)testSimpleAddition{
    XCTAssertEqualObjects([[IDJMoney dollarWithAmount:5] plus:[IDJMoney dollarWithAmount:5]],[IDJMoney dollarWithAmount:10],@"$5 + $5 = $10");
}
@end
