//
//  IDJEuroTests.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 02/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDJEuro.h"

@interface IDJEuroTests : XCTestCase

@end

@implementation IDJEuroTests

-(void)testMultiplication{
    IDJEuro *five = [[IDJEuro alloc] initWithAmount:5];
    IDJEuro *total = [five times:2];
    IDJEuro *ten = [[IDJEuro alloc] initWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}

-(void)testEquality{
    IDJEuro *five = [[IDJEuro alloc] initWithAmount:5];
    IDJEuro *ten = [[IDJEuro alloc] initWithAmount:10];
    IDJEuro *total = [five times:2];
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    XCTAssertFalse([total isEqual:five], @"Equivalent objects should be equal!");
}

-(void)testHash{
    IDJEuro *a = [[IDJEuro alloc] initWithAmount:2];
    IDJEuro *b = [[IDJEuro alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash],@"Equivalent objects should be equal");
}

@end
