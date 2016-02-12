//
//  IDJMoneyTests.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDJMoney.h"

@interface IDJDollarTests : XCTestCase

@end

@implementation IDJDollarTests

-(void)testMultiplication{
    IDJMoney *five = [IDJMoney dollarWithAmount:5];
    IDJMoney *total = [five times:2];
    IDJMoney *ten = [IDJMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"$5 * 2 should be $10");
}

-(void)testEquality{
    IDJMoney *five = [IDJMoney dollarWithAmount:5];
    IDJMoney *ten = [IDJMoney dollarWithAmount:10];
    IDJMoney *total = [five times:2];
    XCTAssertEqualObjects(ten, total, @"Equivalent objest should be equal!");
    XCTAssertFalse([total isEqual:five], @"Non Equivalent objest should not be equal!");
}

-(void)testHash{
    IDJMoney *a = [IDJMoney dollarWithAmount:2];
    IDJMoney *b = [IDJMoney dollarWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash],@"Equivalent objects should be equal");
}

-(void)testAmountStorage{
    IDJMoney *dollar = [IDJMoney dollarWithAmount:2];
    
#pragma clang dianostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2,[[dollar performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}

@end
