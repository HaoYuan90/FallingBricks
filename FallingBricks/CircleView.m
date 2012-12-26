#import "CircleView.h"

@implementation CircleView

@synthesize color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame Color:(UIColor *)c  
{
    self = [self initWithFrame:frame];
    //test color, need to be changed to white
    self.backgroundColor = [UIColor whiteColor];
    color = c;
    return self;
}

- (void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillEllipseInRect(context, self.bounds);
}

@end
