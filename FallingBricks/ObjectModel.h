//for coder's own use
//thoroughly checkded code quality

#import <Foundation/Foundation.h>
#import "Vector2D.h"

//this is an abstract class
//abstraction is ensured by logs, if a method is supposed to be implemented by child, 
//warning will be shown

@interface ObjectModel : NSObject{
    CGFloat mass;
    Vector2D *velocity;
    CGFloat angularVelocity;
    
    CGPoint origin;
    CGFloat rotation;
    CGFloat restitution;
    CGFloat friction;
}

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGFloat rotation;
@property (nonatomic, readonly) CGPoint center;

@property (nonatomic, readonly) CGFloat mass;
@property (nonatomic, readonly) CGFloat momentOfInertia;
@property (nonatomic, strong) Vector2D *velocity;
@property (nonatomic) CGFloat angularVelocity;
@property (nonatomic, readonly) CGFloat restitution;
@property (nonatomic, readonly) CGFloat friction;

- (void)translateX:(CGFloat)dx Y:(CGFloat)dy;
- (CGRect)boundingBox;

-(void) applyGravity: (CGFloat) time gravity:(Vector2D*)g ;
-(void) updatePosition : (CGFloat) time;

@end
