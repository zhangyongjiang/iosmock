//
//  ViewPosition.h
//  iosmock
//
//  Created by Kevin Zhang on 11/24/14.
//  Copyright (c) 2014 Kevin Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Position : NSObject

@property(strong,nonatomic)NSString* relatedTo;
@property(strong,nonatomic)NSNumber* number;
@property(strong,nonatomic)NSNumber* percent;

@end


@interface ViewPosition : NSObject

@property(strong,nonatomic)Position* top;
@property(strong,nonatomic)Position* left;
@property(strong,nonatomic)Position* right;
@property(strong,nonatomic)Position* bottom;


@end
