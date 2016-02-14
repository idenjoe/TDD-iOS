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
@property (nonatomic,strong) IDJMoney *oneDollar;
@end

@implementation IDJBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.oneDollar = [IDJMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.oneDollar = nil;
}

-(void) testSimpleReduction {
    IDJMoney *sum = [[IDJMoney dollarWithAmount:5] plus:[IDJMoney dollarWithAmount:5]];
    
    IDJMoney *reduced = [[IDJBroker sharedInstance] reduce: sum toCurrency:@"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

//$10 == €5 2:1
-(void)testReduction{
    
    [[IDJBroker sharedInstance] addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    IDJMoney *dollars = [IDJMoney dollarWithAmount:10];
    IDJMoney *euros = [IDJMoney euroWithAmount:5];
    
    IDJMoney *converted = [[IDJBroker sharedInstance] reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}

-(void)testThatNotRateRaisesException{
    IDJBroker *broker = [[IDJBroker alloc] init];
    XCTAssertThrows([broker reduce:self.oneDollar toCurrency:@"EUR"],@"No rates should cause exception");
}

-(void)testThatNilCOnversionDoesNotChangedMoney{
    XCTAssertEqualObjects(self.oneDollar, [[IDJBroker sharedInstance] reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should hace no effect");
}

@end
