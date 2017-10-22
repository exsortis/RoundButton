//
//  RoundButtonTests.m
//  RoundButtonTests
//
//  Created by Paul Schifferer on 11/1/15.
//  Copyright © 2015 Pilgrimage Software. All rights reserved.
//

#import <XCTest/XCTest.h>
@import RoundButton;


@interface RoundButtonTests : XCTestCase

@end

@implementation RoundButtonTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInstantiation {
    RoundButton* b = [RoundButton new];
    XCTAssertNotNil(b);
}

@end
