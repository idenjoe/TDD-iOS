//
//  IDJWalletTests.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDJMoney.h"
#import "IDJBroker.h"
#import "IDJWallet.h"

@interface IDJWalletTests : XCTestCase
@property (nonatomic, strong) IDJBroker *broker;
@end

@implementation IDJWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.broker = [[IDJBroker alloc] init];
    [self.broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.broker = nil;
}

// €40 + $20 = $100 2:1
-(void)testAdditionWithReduction{
    IDJWallet *wallet = [[IDJWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[IDJMoney dollarWithAmount:20]];
    IDJMoney *reduced = [self.broker reduce:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [IDJMoney dollarWithAmount:100],@"€40 + $20 = $100 2:1");
}

-(void)testThatWhenAddTenEurosTheWalletHasPreviuosAmountPlusTenEuros{
    IDJWallet *wallet = [[IDJWallet alloc] initWithAmount:20 currency:@"EUR"];
    [wallet addMoney:[IDJMoney euroWithAmount:10]];
    IDJMoney *reduced = [self.broker reduce:wallet toCurrency:@"EUR"];
    XCTAssertEqualObjects(reduced, [IDJMoney euroWithAmount:30],@"20€+10€ = 30€");
}

-(void)testThatWhenTakeTenEurosTheWalletHasPreviousAmountMinusTenEuros{
    IDJWallet *wallet = [[IDJWallet alloc] initWithAmount:20 currency:@"EUR"];
    [wallet takeMoney:[IDJMoney euroWithAmount:10]];
    IDJMoney *reduced = [self.broker reduce:wallet toCurrency:@"EUR"];
    XCTAssertEqualObjects(reduced, [IDJMoney euroWithAmount:10],@"20€-10€ = 10€");
}

//Assuming the wallet could not be negative.
-(void)testThatWhenTakeTenEurosAndTheWalletHadZeroAmountTheWalletIsStillEmpty{
    IDJWallet *wallet = [[IDJWallet alloc] initWithAmount:0 currency:@"EUR"];
    [wallet takeMoney:[IDJMoney euroWithAmount:10]];
    IDJMoney *reduced = [self.broker reduce:wallet toCurrency:@"EUR"];
    XCTAssertEqualObjects(reduced, [IDJMoney euroWithAmount:0],@"0€-10€ = 0€");
}

@end
