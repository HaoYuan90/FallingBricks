#import "CircleModel.h"

@implementation CircleModel

@synthesize radius;

- (id)initWithOrigin:(CGPoint)o radius:(CGFloat)r mass:(CGFloat)m 
{
    radius = r;
    origin = o;
    rotation = 45;
    mass = m; 
    velocity = [Vector2D vectorWith:0 y:0];
    angularVelocity = 0;
    restitution = 0.5;
    return self;
}

- (CGPoint)center {
    return CGPointMake((self.origin.x + self.radius), (self.origin.y + self.radius));
}

- (void)translateX:(CGFloat)dx Y:(CGFloat)dy {
    origin = CGPointMake(origin.x+dx, origin.y+dy);
}

- (CGRect)boundingBox {	
    return CGRectMake(origin.x,origin.y,2*radius,2*radius);
}

- (CGFloat) momentOfInertia 
{
    //check this online
    return (radius*radius*M_PI)/4 * mass;
}

@end
