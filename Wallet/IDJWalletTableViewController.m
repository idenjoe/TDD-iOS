//
//  IDJWalletTableViewController.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "IDJWalletTableViewController.h"
#import "IDJWallet.h"

@interface IDJWalletTableViewController ()
@property (nonatomic, strong) IDJWallet *wallet;
@end

@implementation IDJWalletTableViewController

-(id)initWithModel:(IDJWallet *)wallet{
    if (self = [super init]) {
        _wallet = wallet;
    }
    
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.wallet.countCurrencies+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.wallet moneyAtIndex:section] + 1;
}

@end
