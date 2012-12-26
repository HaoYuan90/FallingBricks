#import "Edge.h"

#define hugeMass 1000
#define screenWidth 768
#define screenHeight 1004
#define edgeFriction 0.9
#define edgeRestitution 0.5
#define edgeWidth 1000
#define edgeHeight 1000

@implementation Edge

@synthesize width;
@synthesize height;

- (CGFloat) momentOfInertia 
{
    return (width*width + height*height)/12 * mass;
}

-(id) initEdge:(edgePosition)edge {
    //EFFECT: init an edge of the screen according to position specified
    self = [super init];
    if(self == nil){
        NSLog(@"malloc error");
        return self;
    }
    height = edgeHeight;
    width = edgeWidth;
    switch (edge) {
        case top:
            origin = CGPointMake(0, 0-height);
            break;
        case btm:
            origin = CGPointMake(0, screenHeight);
            break;
        case left:
            origin = CGPointMake(0-width, 0);
            break;
        case right:
            origin = CGPointMake(screenWidth, 0);
            break;
        default:
            NSLog(@"invalid edge");
    }
    rotation = 0;
    velocity = [Vector2D vectorWith:0 y:0];
    angularVelocity = 0;
    restitution = edgeRestitution;
    friction = edgeFriction;
    mass = hugeMass;
    
    return self;
}

//OVERIDE METHODS TO ENSURE EDGE IS STATIC.
-(void) setVelocity:(Vector2D *)velocity{
    return;
}
-(void) setAngularVelocity:(CGFloat)angularVelocity{
    return;
}

-(void) applyGravity:(CGFloat)time gravity:(Vector2D*)g
{
    return;
}

-(void) updatePosition:(CGFloat)time {
    return;
}

-(void) applyImpulse:(Vector2D*)imp dv:(Vector2D *)r{
    return;
}


@end
