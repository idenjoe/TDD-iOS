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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    IDJWallet *wallet = [[IDJWallet alloc] initWithAmount:30 currency:@"EUR"];
    IDJWalletTableViewController *walletVC = [[IDJWalletTableViewController alloc] initWithModel:wallet];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = walletVC;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
