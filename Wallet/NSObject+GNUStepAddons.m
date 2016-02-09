//
//  NSObject+GNUStepAddons.m
//  Wallet
//
//  Created by José Manuel Rodríguez Moreno on 09/02/16.
//  Copyright © 2016 Idenjoe.es. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

-(id)subclassResponsability:(SEL)aSel{
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    
    [NSException raise:NSInvalidArgumentException
                format:@"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]),prefix,NSStringFromSelector(aSel)];
    
    return self;    // not reached
}

@end
