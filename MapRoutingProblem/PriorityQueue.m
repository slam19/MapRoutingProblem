//
//  PriorityQueue.m
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/15/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityQueue.h"

@implementation PriorityQueue

-(void) enqueue:(Vertex *)v{
    if(!self.binaryHeap){
        self.binaryHeap = [[NSMutableArray alloc]init];
        Vertex *empty = [[Vertex alloc]initEmptyVertex];
        [self.binaryHeap addObject:empty];
        [self.binaryHeap addObject:v];
    }else{
        [self.binaryHeap addObject:v];
        int index = (int) self.binaryHeap.count -1;
        
        Vertex *temp = [self.binaryHeap objectAtIndex:index/2];
        
        while(true){
            if(v.cost<temp.cost){
                [self.binaryHeap replaceObjectAtIndex:index withObject:temp];
                [self.binaryHeap replaceObjectAtIndex:index/2 withObject:v];
                index = index/2;
            }else{
                break;
            }
            temp = [self.binaryHeap objectAtIndex:index];
        }
    }
}

-(Vertex *) dequeue{
    if(self.binaryHeap.count ==1){
        return nil;
    }
    
    Vertex *v = [self.binaryHeap objectAtIndex:1];
    
    if(self.binaryHeap.count ==2){
        [self.binaryHeap removeObjectAtIndex:1];
    
    }else{
        Vertex *temp = [self.binaryHeap objectAtIndex:self.binaryHeap.count -1];
        [self.binaryHeap removeObjectAtIndex:self.binaryHeap.count-1];
        [self.binaryHeap replaceObjectAtIndex:1 withObject:temp]; //least cost is higher
        
        int index = 1;
        while (true) {
            if(index*2 <= self.binaryHeap.count-1){
                Vertex *leftChild = [self.binaryHeap objectAtIndex:index*2];
                if(index*2 + 1 > self.binaryHeap.count - 1){
                    if(temp.cost>leftChild.cost){
                        [self.binaryHeap replaceObjectAtIndex:index withObject:leftChild];
                        [self.binaryHeap replaceObjectAtIndex:index*2 withObject:temp];
                    }
                    break;
                }
                Vertex *rightChild = [self.binaryHeap objectAtIndex:index*2 +1];
                if(!(rightChild.cost >temp.cost && leftChild.cost >temp.cost)){
                    break;
                }
                if(leftChild.cost < rightChild.cost){
                    if(temp.cost>leftChild.cost){
                        [self.binaryHeap replaceObjectAtIndex:index withObject:leftChild];
                        [self.binaryHeap replaceObjectAtIndex:index*2 withObject:temp];
                        index = index*2;
                    }
                }else{
                    if(temp.cost>rightChild.cost){
                        [self.binaryHeap replaceObjectAtIndex:index withObject:rightChild];
                        [self.binaryHeap replaceObjectAtIndex:index*2 +1 withObject:temp];
                        index = index*2 +1;
                    }
                }
            }else{
                break;
            }
        }
    }
    return v;
}
@end
