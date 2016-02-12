//
//  IDJEuroTests.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 02/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDJMoney.h"

@interface IDJEuroTests : XCTestCase

@end

@implementation IDJEuroTests

-(void)testMultiplication{
    IDJMoney *five = [IDJMoney euroWithAmount:5];
    IDJMoney *total = [five times:2];
    IDJMoney *ten = [IDJMoney euroWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}

-(void)testEquality{
    IDJMoney *five = [IDJMoney euroWithAmount:5];
    IDJMoney *ten = [IDJMoney euroWithAmount:10];
    IDJMoney *total = [five times:2];
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    XCTAssertFalse([total isEqual:five], @"Non Equivalent objects should not be equal!");
}

-(void)testHash{
    IDJMoney *a = [IDJMoney euroWithAmount:2];;
    IDJMoney *b = [IDJMoney euroWithAmount:2];;
    
    XCTAssertEqual([a hash], [b hash],@"Equivalent objects should be equal");
}

-(void)testAmountStorage{
    IDJMoney *euro = [IDJMoney euroWithAmount:2];;
    
#pragma clang dianostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2,[[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}

@end
