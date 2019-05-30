//
//  Vertex.m
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/22/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"

@implementation Vertex

-(id) initWithIndex:(int) i AndCost:(int) c AndPrevious: (Vertex *) v{
    self = [super init];
    if (self){
        self.index = i;
        self.cost = c;
        self.previous = v;

    }
    return self;
}

-(id) initEmptyVertex{
    self = [super init];
    if (self){
        self.index = -1;
        self.cost = -1;
        self.previous = nil; 

    }
    return self;
}

@end
