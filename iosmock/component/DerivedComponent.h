//
//  DerivedComponent.h
//  iosmock
//
//  Created by Kevin Zhang on 11/24/14.
//  Copyright (c) 2014 Kevin Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"

@interface DerivedComponent : NSObject

@property(strong,nonatomic)Component* component;
@property(strong,nonatomic)NSMutableDictionary* override;

@end
