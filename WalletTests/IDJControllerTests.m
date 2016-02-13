//
//  IDJControllerTests.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDJSimpleViewController.h"
#import "IDJWalletTableViewController.h"
#import "IDJWallet.h"

@interface IDJControllerTests : XCTestCase
@property (nonatomic, strong) IDJSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) IDJWalletTableViewController *walletVC;
@property (nonatomic, strong) IDJWallet *wallet;
@end

@implementation IDJControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    // Creamos el entorno de laboratorio
    self.simpleVC = [[IDJSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    self.wallet = [[IDJWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[IDJMoney euroWithAmount:1]];
    self.walletVC = [[IDJWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {
    [super tearDown];
    // Lo destruimos
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
    self.wallet = nil;
    self.walletVC = nil;
}

-(void)testThatTextOnLabelIsEquelToTextOnButton{
    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    //Comprobamos que etiqueta y botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text,@"Text titles should be equal");
}

-(void)testThatTableHasOneSection{
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, 1,@"There can only be one");
}

-(void)testThatNumberOfCellsIsNumberOfMoneysPlusOne{
    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0],@"Number of cells are the number of moneys plus 1 (the total)");
}

@end
