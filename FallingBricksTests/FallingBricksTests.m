//
//  FallingBricksTests.m
//  FallingBricksTests
//
//  Created by HaoYuan Jiang on 9/1/12.
//  Copyright (c) 2012 University of Singapore. All rights reserved.
//

#import "FallingBricksTests.h"

@implementation FallingBricksTests

#define accuracy 0.001
#define steppingInterval 1.5f/60.0f

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)simulateEngineWithGravity:(Vector2D*)g timeInterval:(CGFloat)time
{
    //EFFECT: apply gravity to 3 bodies
    Engine *testEngine = [[Engine alloc] initWithDelegate:nil];
    testEngine.gravity = g;
    BrickModel *body1 = [[BrickModel alloc] initWithOrigin:CGPointMake(100, 100) width:100 height:100 rotation:0 mass:10 restitution:0.3 friction:0.9];
    BrickModel *body2 = [[BrickModel alloc] initWithOrigin:CGPointMake(250, 100) width:100 height:100 rotation:0 mass:10 restitution:0.3 friction:0.9];
    BrickModel *body3 = [[BrickModel alloc] initWithOrigin:CGPointMake(550, 100) width:100 height:100 rotation:0 mass:10 restitution:0.3 friction:0.9];
    [testEngine addObject:body1];
    [testEngine addObject:body2];
    [testEngine addObject:body3];
    [testEngine timeStepping];
    
    STAssertEqualsWithAccuracy(body1.velocity.x, g.x*time, accuracy, nil, nil);
    STAssertEqualsWithAccuracy(body1.velocity.y, g.y*time, accuracy, nil, nil);
    STAssertEqualsWithAccuracy(body2.velocity.x, g.x*time, accuracy, nil, nil);
    STAssertEqualsWithAccuracy(body2.velocity.y, g.y*time, accuracy, nil, nil);
    STAssertEqualsWithAccuracy(body3.velocity.x, g.x*time, accuracy, nil, nil);
    STAssertEqualsWithAccuracy(body3.velocity.y, g.y*time, accuracy, nil, nil);
}

- (void) testGravity
{
    [self simulateEngineWithGravity:[Vector2D vectorWith:0 y:0] timeInterval:steppingInterval];
    [self simulateEngineWithGravity:[Vector2D vectorWith:10 y:0] timeInterval:steppingInterval];
    [self simulateEngineWithGravity:[Vector2D vectorWith:0 y:10] timeInterval:steppingInterval];
    [self simulateEngineWithGravity:[Vector2D vectorWith:10 y:10] timeInterval:steppingInterval];
    [self simulateEngineWithGravity:[Vector2D vectorWith:-10 y:-10] timeInterval:steppingInterval];
}

- (void)simulateRestingBody
{
    //EFFECT: simulate bodies touching but with no movements at all
    Engine *testEngine = [[Engine alloc] initWithDelegate:nil];
    testEngine.gravity = [Vector2D vectorWith:0 y:0];
    //vertex kissing
    BrickModel *body1 = [[BrickModel alloc] initWithOrigin:CGPointMake(100, 200) width:100 height:100 rotation:0 mass:10 restitution:0.3 friction:0.9];
    BrickModel *body2 = [[BrickModel alloc] initWithOrigin:CGPointMake(200, 100) width:100 height:100 rotation:0 mass:10 restitution:0.3 friction:0.9];
    //edge kissing
    BrickModel *body3 = [[BrickModel alloc] initWithOrigin:CGPointMake(500, 200) width:100 height:100 rotation:0 mass:10 restitution:0.3 friction:0.9];
    BrickModel *body4 = [[BrickModel alloc] initWithOrigin:CGPointMake(600, 200) width:100 height:100 rotation:0 mass:10 restitution:0.3 friction:0.9];
    BrickModel *body5 = [[BrickModel alloc] initWithOrigin:CGPointMake(700, 200) width:100 height:100 rotation:0 mass:10 restitution:0.3 friction:0.9];
    
    [testEngine addObject:body1];
    [testEngine addObject:body2];
    for(int i=0;i<100;i++){
        [testEngine timeStepping];
        STAssertEqualsWithAccuracy(body1.velocity.x, 0.0, accuracy, @"bodies moving while should be resting", nil);
        STAssertEqualsWithAccuracy(body1.velocity.y, 0.0, accuracy, @"bodies moving while should be resting", nil);
        STAssertEqualsWithAccuracy(body2.velocity.x, 0.0, accuracy, @"bodies moving while should be resting", nil);
        STAssertEqualsWithAccuracy(body2.velocity.y, 0.0, accuracy, @"bodies moving while should be resting", nil);
        STAssertEqualsWithAccuracy(body3.velocity.x, 0.0, accuracy, @"bodies moving while should be resting", nil);
        STAssertEqualsWithAccuracy(body3.velocity.y, 0.0, accuracy, @"bodies moving while should be resting", nil);
        STAssertEqualsWithAccuracy(body4.velocity.x, 0.0, accuracy, @"bodies moving while should be resting", nil);
        STAssertEqualsWithAccuracy(body4.velocity.y, 0.0, accuracy, @"bodies moving while should be resting", nil);
        STAssertEqualsWithAccuracy(body5.velocity.x, 0.0, accuracy, @"bodies moving while should be resting", nil);
        STAssertEqualsWithAccuracy(body5.velocity.y, 0.0, accuracy, @"bodies moving while should be resting", nil);
    }
}

- (void)simulateRestingOnEdge
{
    Engine *testEngine = [[Engine alloc] initWithDelegate:nil];
    testEngine.gravity = [Vector2D vectorWith:0 y:0];
    BrickModel *body1 = [[BrickModel alloc] initWithOrigin:CGPointMake(0, 0) width:100 height:100 rotation:0 mass:10 restitution:0.3 friction:0.9];
    [testEngine addObject:body1];
    for(int i=0;i<100;i++){
        [testEngine timeStepping];
        STAssertEqualsWithAccuracy(body1.velocity.x, 0.0, accuracy, @"bodies should be resting on edges", nil);
        STAssertEqualsWithAccuracy(body1.velocity.y, 0.0, accuracy, @"bodies should be resting on edges", nil);
    }
}

- (void)testRestingBody
{
    [self simulateRestingBody];
    [self simulateRestingOnEdge];
}

//Please check EngineDelegate.h for stategies with regart to validating contact points

@end
