//
//  Coordinate.h
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/22/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef Coordinate_h
#define Coordinate_h
@interface Coordinate<ObjectType>: NSObject

@property int x;
@property int y;
@property bool visited;


-(id) initWithX:(int) x AndY:(int) y;

@end
#endif /* Coordinate_h */
