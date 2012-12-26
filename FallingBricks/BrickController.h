//for coder's own use
//thoroughly checkded code quality

#import <UIKit/UIKit.h>
#import "BrickModel.h"
#import "BrickView.h"
#import "Engine.h"

@interface BrickController: UIViewController {
    BrickModel *model;
    UIView* container;
    Engine* engine;
}

@property (nonatomic, readonly, strong) BrickModel* model;
@property (nonatomic, readonly, strong) UIView* container;
@property (nonatomic, readonly, strong) Engine* engine;

@property (nonatomic, readonly, strong) UIColor* color;

- (id)initWithContainer:(UIView*)con Engine:(Engine*)eng 
                     At:(CGPoint)origin Width:(CGFloat)width Height:(CGFloat)height 
                   Mass:(CGFloat)mass Restitution:(CGFloat)rest Friction:(CGFloat)fric
               Rotation:(CGFloat)rotation Color:(UIColor*) color;

- (void)reloadView;

@end
