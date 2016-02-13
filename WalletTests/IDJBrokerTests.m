//
//  IDJBrokerTests.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDJMoney.h"
#import "IDJBroker.h"

@interface IDJBrokerTests : XCTestCase

@end

@implementation IDJBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testSimpleReduction {
    IDJBroker *broker = [[IDJBroker alloc] init];
    IDJMoney *sum = [[IDJMoney dollarWithAmount:5] plus:[IDJMoney dollarWithAmount:5]];
    
    IDJMoney *reduced = [broker reduce: sum toCurrency:@"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

@end
