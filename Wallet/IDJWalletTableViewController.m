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
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _wallet = wallet;
    }
    
    return self;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.wallet.countCurrencies+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.wallet countMoneyAtIndex:section] + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *moneyCellIdentifier = @"moneyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:moneyCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:moneyCellIdentifier];
    }

    IDJMoney *money = [self.wallet moneyAtSection:indexPath.section andRow:indexPath.row];
    cell.textLabel.text = [[money amount] stringValue];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.wallet currencyAtIndex:section];
}

@end
