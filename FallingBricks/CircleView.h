#import <UIKit/UIKit.h>

@interface CircleView : UIView

@property (nonatomic, readonly, strong) UIColor* color;

- (id)initWithFrame:(CGRect)frame Color:(UIColor*)color;

@end
