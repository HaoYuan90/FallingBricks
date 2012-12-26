#import "CircleController.h"

@implementation CircleController

@synthesize model;
@synthesize container;
@synthesize engine;

@synthesize color;

-(id)initWithContainer:(UIView *)con Engine:(Engine *)eng 
                    At:(CGPoint)origin Radius:(CGFloat)rad Mass:(CGFloat)mass Color:(UIColor *)col      
{
    self = [super init];
    color = col;
    container = con;
    engine = eng;
    model = [[CircleModel alloc] initWithOrigin:origin radius:rad mass:mass];
    [engine addObject:model];
    [container addSubview:self.view];
    return self;
}

-(void)restoreModel
{
    return;
    //model = [[BrickModel alloc] initWithOrigin:CGPointMake(palette_x, palette_y)
    //                                   width:palette_size height:palette_size mass:0];
}

//function to test position of points
-(void) testPointPositions
{
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
    [self.view setCenter:model.center];
    [self.view setTransform : CGAffineTransformMakeRotation(model.rotation * M_PI / 180 )];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object 
                        change:(NSDictionary *)change context:(void *)context
{
    //NSLog(@"observed");
    [self reloadView];
}

#pragma mark - View lifecycle
- (void)loadView
{
    CircleView *circle = [[CircleView alloc] initWithFrame:model.boundingBox Color:color];
    self.view = circle;
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
    [model addObserver:self
            forKeyPath: @"origin"
               options: NSKeyValueObservingOptionNew
               context:nil];
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
