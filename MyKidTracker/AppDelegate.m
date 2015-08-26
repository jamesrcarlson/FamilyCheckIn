//
//  AppDelegate.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate () <MKMapViewDelegate, CLLocationManagerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UILocalNotification *localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (localNotification) {
        application.applicationIconBadgeNumber = 0;
    }
    
    CLLocationManager *locationManager = [CLLocationManager new];
    MKMapView *myMapView = [MKMapView new];
    myMapView.delegate = self;
    
    [locationManager setDelegate:self];
    [locationManager requestAlwaysAuthorization];
    [myMapView setShowsUserLocation:YES];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
//    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]){ //iOS8
//        
//        [application registerUserNotificationSettings:
//         [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge |
//                                                       UIRemoteNotificationTypeSound |
//                                                       UIRemoteNotificationTypeAlert)
//                                           categories:nil]];
//        [application registerForRemoteNotifications];
//        
//    } else {[application registerForRemoteNotificationTypes:(UIRemoteNotificationType)(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
//    }
}

//-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You were notified" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
//    
//    [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
//    
//    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
//    
//    application.applicationIconBadgeNumber = 0;
//}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
