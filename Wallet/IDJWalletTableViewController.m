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

-(BOOL)prefersStatusBarHidden{
    return YES;
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
    if ([self.wallet countMoneyAtIndex:indexPath.section] < indexPath.row+1) {
        
        NSString *boldString = [NSString stringWithFormat:@"Total: %@",[money prettyDescription]];
        NSMutableAttributedString *myBoldString = [[NSMutableAttributedString alloc] initWithString:boldString];
        [myBoldString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20.0] range:NSMakeRange(0,6)];
        cell.textLabel.attributedText = myBoldString;
    }else{
        cell.textLabel.text = [money prettyDescription];
    }
    
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.wallet currencyAtIndex:section];
}

@end
