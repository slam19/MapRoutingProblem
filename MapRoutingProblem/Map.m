//
//  Map.m
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/19/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Map.h"

@implementation Map

-(void) loadMap {
    NSString *myFilePath = [[NSBundle mainBundle] pathForResource:@"usa"ofType:@"txt"];
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:myFilePath encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray* allLineStrings = //array of string lines
    [[fileContent componentsSeparatedByCharactersInSet:
      [NSCharacterSet newlineCharacterSet]]mutableCopy];
    self.graph = [[NSMutableArray alloc] init];
    for(int i = 0; i< 87575; i++){
        NSString *strCoord = [allLineStrings objectAtIndex:i];
        NSArray *arr = [strCoord componentsSeparatedByString:@" "];
        NSMutableArray *data = [arr mutableCopy];
        [data removeObject:@""];
        NSMutableArray *vertex = [[NSMutableArray alloc]init];
        Coordinate *vertexCoord = [[Coordinate alloc]initWithX:[[data objectAtIndex:1]intValue] AndY:[[data objectAtIndex:2]intValue]];
        int index = [[data objectAtIndex:0] intValue];
        [vertex addObject:vertexCoord];
        [self.graph insertObject:vertex atIndex:index];
    }
    for (int i = 87577; i < 209537; i++){
        NSString *strEdge = [allLineStrings objectAtIndex:i];
        NSArray *arr = [strEdge componentsSeparatedByString:@" "];
        NSMutableArray *data = [arr mutableCopy];
        [data removeObject:@""];
        
        int index = [[data objectAtIndex:0]intValue];
        NSNumber *pointer = [[NSNumber alloc]initWithInt:[[data objectAtIndex:1]intValue]];
        NSMutableArray *vertex = [self.graph objectAtIndex:index];
        [vertex addObject:pointer];
        
        int index2 = [[data objectAtIndex:1]intValue]; //can traverse in both directions between vertices.
        NSNumber *pointer2 = [[NSNumber alloc]initWithInt:index];
        NSMutableArray *vertex2 = [self.graph objectAtIndex:index2];
        [vertex2 addObject:pointer2];
        
    }
}


-(Vertex *) computePathFrom: (int) a To: (int) b{
    Vertex *vPointer;
    self.queue = [[PriorityQueue alloc]init];
    Vertex *v = [[Vertex alloc]initWithIndex:a AndCost:0 AndPrevious:nil];
    [self.queue enqueue:v];
    while(true){
        vPointer = [self DjikstrasAlgorithm];
        if(vPointer.index ==b){
            break;
        }
        
    }
    return vPointer;
}


-(Vertex *) DjikstrasAlgorithm {
    Vertex *v = [self.queue dequeue];
    int pointer = v.index;
    Coordinate *temp = [[self.graph objectAtIndex:pointer] objectAtIndex:0];
    temp.visited = true;
    NSMutableArray *adjArray = [self.graph objectAtIndex:v.index];
    for (int i = 1; i < adjArray.count;i++){
        int adjIndex = [[adjArray objectAtIndex:i]intValue];
        Coordinate *checkVisitTemp =[[self.graph objectAtIndex:adjIndex] objectAtIndex:0];
        
        if(!checkVisitTemp.visited){ //if deq already then visited
            int cost = v.cost + [self calculateEdgeWeightFrom:pointer To:adjIndex];
            Vertex *adjVertex = [[Vertex alloc] initWithIndex:adjIndex AndCost:cost AndPrevious:v];
            [self.queue enqueue: adjVertex];
        }
    }
    return v;
}


-(double) calculateEdgeWeightFrom:(int)indexA To:(int)indexB{
    double distance = 0;
    Coordinate*a = [[self.graph objectAtIndex:indexA] objectAtIndex:0];
    Coordinate*b = [[self.graph objectAtIndex:indexB] objectAtIndex:0];
    distance = sqrt (pow((b.y -a.y), 2) + pow((b.x -a.x), 2));
    return distance;
}


-(void) printPath:(Vertex *) v{
    if(!v){
        return;
    }else{
        [self printPath:v.previous];
        printf("%d \n", v.index);
    }
}

@end

