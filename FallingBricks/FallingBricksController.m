#import "FallingBricksController.h"

@implementation ViewController
#define timerInterval 1.5f/60.0f //this is the rate at which accelerometer is updated

@synthesize engine;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"not enough mem");
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    engine = [[Engine alloc] initWithDelegate:self];

    /*[self addChildViewController:[[CircleController alloc] initWithContainer:self.view Engine:engine
            At:CGPointMake(0, 0) Radius:50 Mass:10 Color:[UIColor brownColor]]];*/
    
    //initialise the 7 rectangular bricks for the simulation
    [self addChildViewController:[[BrickController alloc] initWithContainer:self.view Engine:engine 
                At:CGPointMake(100, 100) Width:100 Height:100 Mass:10 Restitution: 0.3 Friction:0.9 Rotation:0 Color:[UIColor greenColor]]];
    [self addChildViewController:[[BrickController alloc] initWithContainer:self.view Engine:engine 
                At:CGPointMake(250, 100) Width:100 Height:100 Mass:10 Restitution: 0.3 Friction:0.9 Rotation:0 Color:[UIColor redColor]]];
    [self addChildViewController:[[BrickController alloc] initWithContainer:self.view Engine:engine 
                At:CGPointMake(550, 100) Width:100 Height:100 Mass:10 Restitution: 0.3 Friction:0.9 Rotation:0 Color:[UIColor blueColor]]];
    [self addChildViewController:[[BrickController alloc] initWithContainer:self.view Engine:engine 
                At:CGPointMake(500, 500) Width:100 Height:100 Mass:10 Restitution: 0.3 Friction:0.9 Rotation:0 Color:[UIColor blackColor]]];
    [self addChildViewController:[[BrickController alloc] initWithContainer:self.view Engine:engine 
                At:CGPointMake(100, 250) Width:300 Height:100 Mass:30 Restitution: 0.3 Friction:0.9 Rotation:0 Color:[UIColor grayColor]]];
    [self addChildViewController:[[BrickController alloc] initWithContainer:self.view Engine:engine 
                At:CGPointMake(450, 250) Width:50 Height:300 Mass:15 Restitution: 0.3 Friction:0.9 Rotation:0 Color:[UIColor orangeColor]]];
    [self addChildViewController:[[BrickController alloc] initWithContainer:self.view Engine:engine 
                At:CGPointMake(100, 650) Width:200 Height:200 Mass:40 Restitution: 0.3 Friction:0.9 Rotation:0 Color:[UIColor purpleColor]]];
    
    NSLog(@"expected frame rate is %f", 60.0f/1.5f);
    UIAccelerometer *acc = [UIAccelerometer sharedAccelerometer];
    acc.delegate = engine;
    acc.updateInterval = timerInterval;
}

- (void) showPt:(CGPoint) pt
{
    //REQUIRES: accelerometer cannot be used for this to work
    UIView *square = [[UIView alloc] initWithFrame:CGRectMake(pt.x-5, pt.y-5, 10, 10)];
    square.backgroundColor = [UIColor blackColor];
    [self.view addSubview: square];
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{square.alpha = 0;}
                     completion:^(BOOL finished) {[square removeFromSuperview];}];
}

- (void) update
{
    for(id temp in self.childViewControllers){
        [temp reloadView];
    }
}
 
- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

@end
