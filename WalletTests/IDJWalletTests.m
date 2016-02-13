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

@end

@implementation IDJWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
-(void)testAdditionWithReduction{
    IDJBroker *broker = [IDJBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    IDJWallet *wallet = [[IDJWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[IDJMoney dollarWithAmount:20]];
    IDJMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [IDJMoney dollarWithAmount:100],@"€40 + $20 = $100 2:1");
}

@end
