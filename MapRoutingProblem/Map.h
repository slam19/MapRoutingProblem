//
//  Map.h
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/19/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef Map_h
#define Map_h
#import "Coordinate.h"
#import "Vertex.h"
#import "PriorityQueue.h"

@interface Map<ObjectType>: NSObject

@property NSMutableArray *graph;
@property PriorityQueue *queue;

-(void) loadMap;
-(double) calculateEdgeWeightFrom:(int) a To:(int)b;
-(Vertex *) computePathFrom:(int)a To: (int) b;
-(Vertex *) DjikstrasAlgorithm;
-(void) printPath:(Vertex *)v;
@end

#endif /* Graph_h */
