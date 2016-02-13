//
//  IDJWalletTableViewController.h
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 13/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IDJWallet;

@interface IDJWalletTableViewController : UITableViewController

-(id)initWithModel:(IDJWallet *)wallet;

@end
