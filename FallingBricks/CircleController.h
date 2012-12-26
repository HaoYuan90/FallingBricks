#import <UIKit/UIKit.h>
#import "CircleModel.h"
#import "CircleView.h"
#import "Engine.h"

@interface CircleController: UIViewController {
    CircleModel *model;
    UIView* container;
    Engine* engine;
}

@property (nonatomic, readonly, strong) CircleModel* model;
@property (nonatomic, readonly, strong) UIView* container;
@property (nonatomic, readonly, strong) Engine* engine;

@property (nonatomic, readonly, strong) UIColor* color;

//init and data handlers
- (id)initWithContainer:(UIView*)con Engine:(Engine*)eng 
                     At:(CGPoint)origin Radius:(CGFloat)rad Mass:(CGFloat)mass 
                  Color:(UIColor*) color;

- (void)reloadView;

@end
