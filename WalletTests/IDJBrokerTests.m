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
@property (nonatomic,strong) IDJBroker *emptyBroker;
@property (nonatomic,strong) IDJMoney *oneDollar;
@end

@implementation IDJBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [IDJBroker new];
    self.oneDollar = [IDJMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void) testSimpleReduction {
    self.emptyBroker = [[IDJBroker alloc] init];
    IDJMoney *sum = [[IDJMoney dollarWithAmount:5] plus:[IDJMoney dollarWithAmount:5]];
    
    IDJMoney *reduced = [self.emptyBroker reduce: sum toCurrency:@"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

//$10 == €5 2:1
-(void)testReduction{
    
    self.emptyBroker = [[IDJBroker alloc] init];
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    IDJMoney *dollars = [IDJMoney dollarWithAmount:10];
    IDJMoney *euros = [IDJMoney euroWithAmount:5];
    
    IDJMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}

-(void)testThatNotRateRaisesException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"],@"No rates should cause exception");
}

-(void)testThatNilCOnversionDoesNotChangedMoney{
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should hace no effect");
}

@end
