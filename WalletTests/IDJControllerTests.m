//
//  IDJControllerTests.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IDJSimpleViewController.h"

@interface IDJControllerTests : XCTestCase
@property (nonatomic, strong) IDJSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
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
}

- (void)tearDown {
    [super tearDown];
    // Lo destruimos
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

-(void)testThatTextOnLabelIsEquelToTextOnButton{
    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    //Comprobamos que etiqueta y botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text,@"Text titles should be equal");
}

@end
