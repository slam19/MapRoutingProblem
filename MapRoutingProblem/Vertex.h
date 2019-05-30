//
//  Vertex.h
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/22/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef Vertex_h
#define Vertex_h

@interface Vertex<ObjectType>: NSObject

@property int index;
@property int cost;
@property Vertex* previous;

-(id) initWithIndex:(int) i AndCost:(int) c AndPrevious: (Vertex *) v;
-(id) initEmptyVertex;

@end
#endif /* Vertex_h */
