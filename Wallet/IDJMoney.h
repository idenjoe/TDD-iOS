//
//  IDJMoney.h
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDJMoney : NSObject

@property(nonatomic, strong) NSString *currency;

+(id)euroWithAmount:(NSInteger)amount;
+(id)dollarWithAmount:(NSInteger)amount;
-(id)initWithAmount:(NSUInteger)amount
           currency:(NSString *)currency;
-(id)times:(NSUInteger)times;

@end
