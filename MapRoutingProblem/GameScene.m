//
//  GameScene.m
//  MapRoutingProblem
//
//  Created by Simon Lam on 4/15/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import "GameScene.h"
#import "Map.h"
#import "Coordinate.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
    SKShapeNode *line;
    SKShapeNode *exploredVertex;
    NSMutableArray *vertices;
    NSMutableArray *edges;
    SKShapeNode *vertex;
    SKShapeNode *edge;
}

- (void)didMoveToView:(SKView *)view {
    Map *map = [[Map alloc]init];
    vertices = [[NSMutableArray alloc] init];
    edges = [[NSMutableArray alloc] init];
    self.size = CGSizeMake(30000, 10000);
    
    [map loadMap];
    
    NSMutableArray *arr = map.graph;
    for( int i = 0; i<arr.count; i=i+7){ //displaying only 1 out of every 7 nodes or else system will overload.
        vertex= [SKShapeNode shapeNodeWithCircleOfRadius:12];
        NSMutableArray *vArr = [arr objectAtIndex:i];
        Coordinate *h= [vArr objectAtIndex:0];
        
        [vertex setPosition:CGPointMake((h.x * 1.3)-6000,(h.y * 1.5)-3000)];
        [vertices addObject:vertex];
        [self addChild:vertex];
    }
    [self displayPathInMap: map];
}


-(void) displayPathInMap:(Map *) map{
    int start = 12;
    int finish = 789;
    Vertex *v = [map computePathFrom:start To:finish];
    Vertex *temp = v;
    int prevX=-1;
    int prevY=-1;
    while(temp){
        int index= temp.index;
        NSMutableArray *arr = map.graph;
        NSMutableArray *vArr = [arr objectAtIndex:index];
        Coordinate *h= [vArr objectAtIndex:0];
        if(temp.index == start || temp.index == finish){ //indicate start and finish with yellow
            exploredVertex= [SKShapeNode shapeNodeWithCircleOfRadius:30];
            exploredVertex.fillColor = [SKColor yellowColor];
        }else{
            exploredVertex= [SKShapeNode shapeNodeWithCircleOfRadius:15]; //visited nodes are red
            exploredVertex.fillColor = [SKColor redColor];
        }
        [exploredVertex setPosition:CGPointMake((h.x * 1.3)-6000,(h.y *1.5)-3000)];
        [self addChild:exploredVertex];
        
        if(prevX!=-1){ //red to indicate traversed paths
            line= [SKShapeNode node];
            CGMutablePathRef pathToDraw = CGPathCreateMutable();
            CGPathMoveToPoint(pathToDraw, NULL, (h.x * 1.3)-6000, (h.y *1.5)-3000);
            temp=temp.previous;
            CGPathAddLineToPoint(pathToDraw, NULL, (prevX * 1.3)-6000, (prevY *1.5)-3000);
            line.path = pathToDraw;
            [line setStrokeColor:[SKColor redColor]];
            [line setLineWidth:8];
            [self addChild:line];
        }
        prevX= h.x;
        prevY= h.y;
    }
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
