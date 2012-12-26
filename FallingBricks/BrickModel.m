#import "BrickModel.h"

@implementation BrickModel

@synthesize width;
@synthesize height;

- (id)initWithOrigin:(CGPoint)o width:(CGFloat)w height:(CGFloat)h 
            rotation:(CGFloat)deg mass:(CGFloat)m restitution:(CGFloat)rest friction:(CGFloat)fric
{
    self = [super init];
    if(self == nil){
        NSLog(@"malloc error");
        return self;
    }
    width = w;
    height = h;
    origin = o;
    rotation = deg;
    mass = m; 
    velocity = [Vector2D vectorWith:0 y:0];
    angularVelocity = 0;
    if(rest>1 || rest<0){
        NSLog(@"resitituion invalid (should be from 0-1)"); 
        restitution = 0;
    }
    else
        restitution = rest;
    if(fric>1 || fric<0){
        NSLog(@"friction invalid (should be from 0-1)"); 
        friction = 1;
    }
    else
        friction = fric;
    return self;
}

- (CGPoint)center 
{
    //EFFECT: return the geometric center of object (center of rotation)
    return CGPointMake((self.origin.x + self.width/2), (self.origin.y + self.height/2));
}

+ (CGPoint)rotatePoint: (CGPoint)pt ClockwiseWithBase: (CGPoint)base Degree:(CGFloat)dg 
{
    //EFFECT: return a point that is rotated n degrees with respect to another point
    CGFloat rotationRad = dg * M_PI /180;
    CGFloat x,y;
    x = (pt.x-base.x) * cos(rotationRad) - (pt.y-base.y) * sin(rotationRad) + base.x;
    y = (pt.y-base.y) * cos(rotationRad) + (pt.x-base.x) * sin(rotationRad) + base.y;
    return CGPointMake(x,y);
}

- (CGPoint)cornerFrom:(CornerType)corner 
{
    //EFFECT: get coordinates of a corner specified by the corner type
    switch(corner){
        case kTopLeftCorner:
            return [BrickModel rotatePoint: self.origin ClockwiseWithBase: self.center Degree: self.rotation];
        case kTopRightCorner:
            return [BrickModel rotatePoint: CGPointMake(self.origin.x+self.width, self.origin.y) ClockwiseWithBase: self.center Degree: self.rotation];
        case kBottomLeftCorner:
            return [BrickModel rotatePoint: CGPointMake(self.origin.x, self.origin.y+self.height) ClockwiseWithBase: self.center Degree: self.rotation];
        case kBottomRightCorner:
            return [BrickModel rotatePoint: CGPointMake(self.origin.x+self.width, self.origin.y+self.height) ClockwiseWithBase: self.center Degree: self.rotation];
        default:
            NSLog(@"error");
            return self.origin;
    }
}

- (CGPoint*)corners 
{
    //EFFECT: return an array of 4 corners of rectangle
    CGPoint *corners = (CGPoint*) malloc(4*sizeof(CGPoint));
    corners[0] = [self cornerFrom: kTopLeftCorner];
    corners[1] = [self cornerFrom: kTopRightCorner];
    corners[2] = [self cornerFrom: kBottomRightCorner];
    corners[3] = [self cornerFrom: kBottomLeftCorner];
    return corners;
}

- (CGRect)boundingBox 
{	
    //EFFECT: return the smallest upright(no rotation) rectangle that bounds this rectangle
    CGPoint* cors = self.corners;
    CGFloat smallestX = cors[0].x;
    CGFloat biggestX = cors[0].x;
    CGFloat smallestY = cors[0].y;
    CGFloat biggestY = cors[0].y;
    for(int i=1;i<4;i++){
        biggestX = MAX(cors[i].x,biggestX);
        smallestX = MIN(cors[i].x,smallestX);
        biggestY = MAX(cors[i].y,biggestY);
        smallestY = MIN(cors[i].y,smallestY);
    }
    return CGRectMake(smallestX,smallestY,biggestX-smallestX,biggestY-smallestY);
}

- (CGFloat) momentOfInertia 
{
    return (width*width + height*height)/12 * mass;
}

@end
