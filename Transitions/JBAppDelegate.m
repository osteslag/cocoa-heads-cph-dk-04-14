//
//  JBAppDelegate.m
//  Transitions
//
//  Created by Joachim Bondo on 10/04/2014.
//  Copyright (c) 2014 Joachim Bondo. All rights reserved.
//

#import "JBAppDelegate.h"
#import "JBChildViewController.h"
#import "JBAnimatedTabTransition.h"

@implementation JBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [self JB_configuredRootViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - UITabBarControllerDelegate Protocol

// Return the object we want to perform the transition animation.
- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
	return [[JBAnimatedTabTransition alloc] init];
}

#pragma mark - Private Methods

- (UIViewController *)JB_configuredRootViewController {
    
    UITabBarController *rootTabBarController = [[UITabBarController alloc] init];
	rootTabBarController.delegate = self;
    [self JB_configureTabBarController:rootTabBarController];
    
    return rootTabBarController;
}

- (void)JB_configureTabBarController:(UITabBarController *)tabBarController {
    
    NSMutableArray *childViewControllers = [[NSMutableArray alloc] initWithCapacity:3];
    NSArray *configurations = @[
       @{@"title": @"First", @"color": [UIColor colorWithRed:0.4f green:0.8f blue:1 alpha:1]},
       @{@"title": @"Second", @"color": [UIColor colorWithRed:1 green:0.4f blue:0.8f alpha:1]},
       @{@"title": @"Third", @"color": [UIColor colorWithRed:1 green:0.8f blue:0.4f alpha:1]},
    ];
    
    for (NSDictionary *configuration in configurations) {
        JBChildViewController *childViewController = [[JBChildViewController alloc] init];
        
        childViewController.title = configuration[@"title"];
        childViewController.themeColor = configuration[@"color"];
        childViewController.tabBarItem.image = [UIImage imageNamed:configuration[@"title"]];
        childViewController.tabBarItem.selectedImage = [UIImage imageNamed:[configuration[@"title"] stringByAppendingString:@" Selected"]];
        
        [childViewControllers addObject:childViewController];
    }
    
    [tabBarController setViewControllers:childViewControllers];
}

@end
