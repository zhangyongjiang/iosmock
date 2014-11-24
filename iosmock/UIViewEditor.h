//
//  UIViewComponentEditor.h
//  iosmock
//
//  Created by Kevin Zhang on 11/24/14.
//  Copyright (c) 2014 Kevin Zhang. All rights reserved.
//

#import "ComponentEditor.h"
#import "ViewPosition.h"
#import "ViewNumber.h"

@interface UIViewEditor : ComponentEditor

@property(strong,nonatomic)Position* top;
@property(strong,nonatomic)Position* left;
@property(strong,nonatomic)Position* right;
@property(strong,nonatomic)Position* bottom;
@property(strong,nonatomic)ViewNumber* width;
@property(strong,nonatomic)ViewNumber* height;


@end
