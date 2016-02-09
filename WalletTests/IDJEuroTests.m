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
    
    XCTAssertEqual(total.amount,10,@"5*2 should be 10");
    
    IDJEuro *ten = [[IDJEuro alloc] initWithAmount:10];
    IDJEuro *total2 = [ten times:3];
    XCTAssertEqual(total2.amount,30,@"5*2 should be 10");
    
}

@end
