#import "ObjectModel.h"

@implementation ObjectModel

@synthesize mass;
@synthesize velocity;
@synthesize angularVelocity;
@synthesize restitution;
@synthesize friction;

@synthesize origin;
@synthesize rotation;
@synthesize center;

- (void)setRotate:(CGFloat)angle 
{
    //REQUIRES: angle will not be a drastic number, ensure due to physics stepping being very small thus not an issue
    //EFFECT: set model's rotation, and simplify it accordingly to facilitate testing
    rotation = angle;
    if(rotation > 360)
        rotation -= 360;
    if(rotation < -360)
        rotation +=360;
}

- (void)translateX:(CGFloat)dx Y:(CGFloat)dy 
{
    //EFFECT: translate the model by (dx,dy)
    origin = CGPointMake(origin.x+dx, origin.y+dy);
}

-(void) applyGravity:(CGFloat)time gravity:(Vector2D*)g
{
    //EFFECT: update velocity with gravity for a time interval
    velocity = [velocity add:[g multiply:time]];
}

-(CGFloat) momentOfInertia
{
    //must be implemented by subclass
    NSLog(@"this method should not be called <momentOfInertia>");
    return 0;
}

-(CGRect) boundingBox
{
    //must be implemented by subclass
    NSLog(@"this method should not be called <boundingBox>");
    return CGRectMake(0, 0, 0, 0);
}

-(void) updatePosition:(CGFloat)time 
{
    //EFFECT: update position of the object according to its velocities and time interval given
    Vector2D *temp = [velocity multiply:time];
    rotation = rotation + time*angularVelocity/M_PI * 180;
    origin = CGPointMake(origin.x+temp.x, origin.y+temp.y);
}

@end
