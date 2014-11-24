//
//  Component.h
//  iosmock
//
//  Created by Kevin Zhang on 11/24/14.
//  Copyright (c) 2014 Kevin Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Component : NSObject

@property(strong,nonatomic)NSString* name;
@property(strong,nonatomic)Component* parent;
@property(strong,nonatomic)NSMutableArray* attributes;
@property(strong,nonatomic)NSMutableArray* subcomponents;

-(void)render;

@end
