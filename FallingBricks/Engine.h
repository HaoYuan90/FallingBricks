//for coder's own use
//thoroughly checkded code quality

#import <Foundation/Foundation.h>
#import "ObjectModel.h"
#import "BrickModel.h"
#import "CircleModel.h"
#import "Edge.h"
#import "Vector2D.h"
#import "Matrix2D.h"
#import "EngineDelegate.h"

@interface Engine : NSObject <UIAccelerometerDelegate> {
    NSMutableArray *objects;
    NSArray *edges;
}

@property (nonatomic, strong) NSMutableArray* objects;
@property (nonatomic, readonly, strong) NSArray* edges;
@property (nonatomic, strong) Vector2D* gravity;
@property (nonatomic, readonly, strong) id<EngineDelegate> delegate;

- (id) initWithDelegate: (id<EngineDelegate>)del;

- (void) addObject: (ObjectModel*)object;

- (void) timeStepping;

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;

@end
