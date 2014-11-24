//
//  Component.m
//  iosmock
//
//  Created by Kevin Zhang on 11/24/14.
//  Copyright (c) 2014 Kevin Zhang. All rights reserved.
//

#import "Component.h"

@implementation Component

-(void)render {
    [self.parent render];
    for (NSString* name in self.subcomponents) {
        IClass* subcomponent = [self.subcomponents objectForKey:name];
        [subcomponent render];
    }
}

@end
