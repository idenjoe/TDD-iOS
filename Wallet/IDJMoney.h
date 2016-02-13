//
//  IDJMoney.h
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IDJMoney;
@class IDJBroker;

@protocol IDJMoney <NSObject>

-(id)initWithAmount:(NSUInteger)amount
           currency:(NSString *)currency;
-(id<IDJMoney>)times:(NSUInteger)times;
-(id<IDJMoney>)plus:(IDJMoney *)other;
-(id<IDJMoney>)reduceToCurrency:(NSString *)currency withBroker:(IDJBroker *)broker;

@end

@interface IDJMoney : NSObject<IDJMoney>
@property(nonatomic,strong,readonly) NSNumber *amount;
@property(nonatomic, strong) NSString *currency;

+(id)euroWithAmount:(NSInteger)amount;
+(id)dollarWithAmount:(NSInteger)amount;

@end
