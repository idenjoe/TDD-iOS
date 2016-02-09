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

-(void)testThatTimesRaisesException{
    IDJMoney *money = [[IDJMoney alloc] initWithAmount:1];
    
    XCTAssertThrows([money times:2],@"Should raise an exception");
}

@end
