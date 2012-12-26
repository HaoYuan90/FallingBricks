//for coder's own use
//thoroughly checkded code quality

#import <Foundation/Foundation.h>
#import "Vector2D.h"
#import "ObjectModel.h"

typedef enum {
    kTopLeftCorner = 1,
    kTopRightCorner = 2,
    kBottomLeftCorner = 3,
    kBottomRightCorner = 4
} CornerType;

//as oppose to PS1 rotation is clockWise

@interface BrickModel : ObjectModel {
}

@property (nonatomic, readonly) CGFloat width;
@property (nonatomic, readonly) CGFloat height;
@property (nonatomic, readonly) CGPoint* corners;

-(id)initWithOrigin:(CGPoint)o width:(CGFloat)w height:(CGFloat)h 
           rotation:(CGFloat)deg mass:(CGFloat)m restitution:(CGFloat)rest friction:(CGFloat)fric;

@end
