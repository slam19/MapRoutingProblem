//
//  Coordinate.m
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/22/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinate.h"

@implementation Coordinate

-(id) initWithX:(int) x AndY:(int) y{
    self = [super init];
    if (self){
        self.x = x;
        self.y = y;
    }
    return self;
}

@end
