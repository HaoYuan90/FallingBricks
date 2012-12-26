#import "BrickController.h"

@implementation BrickController

@synthesize model;
@synthesize container;
@synthesize engine;

@synthesize color;

-(id)initWithContainer:(UIView *)con Engine:(Engine *)eng At:(CGPoint)origin 
                 Width:(CGFloat)width Height:(CGFloat)height Mass:(CGFloat)mass 
           Restitution:(CGFloat)rest Friction:(CGFloat)fric
              Rotation:(CGFloat)rotation Color:(UIColor *)col
{
    self = [super init];
    if(self == nil){
        NSLog(@"malloc error");
        return self;
    }
    color = col;
    container = con;
    engine = eng;
    model = [[BrickModel alloc] initWithOrigin:origin width:width 
                                        height:height rotation:rotation mass:mass restitution:rest friction:fric];
    [engine addObject:model];
    [container addSubview:self.view];
    return self;
}

-(void) testPointPositions{
    //EFFECT: function to test position of points
    UIView *test1 = [[UIView alloc] initWithFrame:CGRectMake(model.center.x - 2.5, model.center.y-2.5, 5, 5)];
    test1.backgroundColor = [UIColor blackColor];
    [container addSubview:test1];
    UIView *test2 = [[UIView alloc] initWithFrame:CGRectMake(model.origin.x - 2.5, model.origin.y-2.5, 5, 5)];
    test2.backgroundColor = [UIColor redColor];
    [container addSubview:test2];
    UIView *test3 = [[UIView alloc] initWithFrame:CGRectMake(model.center.x - 2.5, model.center.y-2.5, 5, 5)];
    test1.backgroundColor = [UIColor blackColor];
    [container addSubview:test3];
    UIView *test4 = [[UIView alloc] initWithFrame:CGRectMake(model.origin.x - 2.5, model.origin.y-2.5, 5, 5)];
    test2.backgroundColor = [UIColor redColor];
    [container addSubview:test4];
}

-(void)reloadView
{
    //EFFECT: update the controller's main view
    [self.view setCenter:model.center];
    [self.view setTransform : CGAffineTransformMakeRotation(model.rotation * M_PI / 180 )];
}

#pragma mark - View lifecycle
- (void)loadView
{
    //EFFECT: load a view according to params passed in init function
    BrickView *brick = [[BrickView alloc] 
                        initWithFrame:(CGRectMake(model.origin.x, model.origin.y, model.width, model.height))
                                Color:color];
    self.view = brick;
    [self.view setTransform : CGAffineTransformMakeRotation(model.rotation * M_PI / 180 )];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];; 
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
