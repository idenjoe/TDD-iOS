//
//  AppDelegate.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 02/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import "AppDelegate.h"
#import "IDJWalletTableViewController.h"
#import "IDJWallet.h"
#import "IDJBroker.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    IDJBroker *broker = [IDJBroker sharedInstance];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    IDJWallet *wallet = [[IDJWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet addMoney:[IDJMoney dollarWithAmount:30]];
    [wallet addMoney:[IDJMoney dollarWithAmount:5]];
    [wallet addMoney:[IDJMoney dollarWithAmount:10]];
    [wallet addMoney:[IDJMoney euroWithAmount:40]];
    [wallet addMoney:[IDJMoney euroWithAmount:150]];
    [wallet addMoney:[IDJMoney euroWithAmount:3]];
    IDJWalletTableViewController *walletVC = [[IDJWalletTableViewController alloc] initWithModel:wallet];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:walletVC];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
