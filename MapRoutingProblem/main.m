//
//  main.m
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/15/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Map.h"
#import "PriorityQueue.h"
int main(int argc, const char * argv[]) {
    //uncomment below to check non-visual implementation
//    @autoreleasepool {
//        Map *map = [[Map alloc] init];
//        [map loadMap];
//        Vertex *v = [map computePathFrom:55 To:359];
//        [map printPath: v];
//
//    }
//        return 0;

    return NSApplicationMain(argc, argv);
}
