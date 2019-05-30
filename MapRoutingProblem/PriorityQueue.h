//
//  PriorityQueue.h
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/15/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef PriorityQueue_h
#define PriorityQueue_h
#import "Vertex.h"
@interface PriorityQueue<ObjectType>: NSObject

@property NSMutableArray *binaryHeap;

-(void) enqueue: (Vertex *) v;
-(Vertex *) dequeue;
@end
#endif /* PriorityQueue_h */
