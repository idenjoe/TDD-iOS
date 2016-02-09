//
//  IDJDollarTests.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDJDollar.h"

@interface IDJDollarTests : XCTestCase

@end

@implementation IDJDollarTests

-(void)testMultiplication{
    IDJDollar *five = [[IDJDollar alloc] initWithAmount:5];
    IDJDollar *total = [five times:2];
    IDJDollar *ten = [[IDJDollar alloc] initWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"$5 * 2 should be $10");
}

-(void)testEquality{
    IDJDollar *five = [[IDJDollar alloc] initWithAmount:5];
    IDJDollar *ten = [[IDJDollar alloc] initWithAmount:10];
    IDJDollar *total = [five times:2];
    XCTAssertEqualObjects(ten, total, @"Equivalent objest should be equal!");
    XCTAssertFalse([total isEqual:five], @"Equivalent objest should be equal!");
}

-(void)testHash{
    IDJDollar *a = [[IDJDollar alloc] initWithAmount:2];
    IDJDollar *b = [[IDJDollar alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash],@"Equivalent objects should be equal");
}

@end
