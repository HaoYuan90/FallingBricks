//for coder's own use
//thoroughly checkded code quality

#import <UIKit/UIKit.h>
#import "BrickController.h"
#import "CircleController.h"
#import "Engine.h"
#import "EngineDelegate.h"

@interface ViewController : UIViewController <EngineDelegate>{
    Engine *engine;
}

@property (nonatomic, readonly, strong) Engine *engine;

@end
