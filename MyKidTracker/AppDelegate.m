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
#import "NotificationsController.h"

@interface AppDelegate () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) NotificationsController *notificationController;

@end

@implementation AppDelegate

// https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/LocationAwarenessPG/RegionMonitoring/RegionMonitoring.html#//apple_ref/doc/uid/TP40009497-CH9-SW1

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.notificationController = [NotificationsController new];
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusNotDetermined:
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.notificationController registerNotifications];
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            [self.notificationController setUpLocations];
            break;
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            [self.notificationController alertUserToStatus];
            break;
    }
    
    UILocalNotification *localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (localNotification) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You were notified" message:@"here it is" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
        UINavigationController *navCont = (UINavigationController *)self.window.rootViewController;
        [navCont.topViewController presentViewController:alertController animated:YES completion:nil];
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


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
        [application registerUserNotificationSettings:
         [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge |
                                                       UIUserNotificationTypeSound |
                                                       UIUserNotificationTypeAlert)
                                           categories:nil]];
    
        [application registerForRemoteNotifications];
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You were notified" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    UINavigationController *navCont = (UINavigationController *)self.window.rootViewController;
    [navCont.topViewController presentViewController:alertController animated:YES completion:nil];
    
    application.applicationIconBadgeNumber = 0;
}

// dealing with custom notifcation actions

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
    
}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler {
    
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    // Check status to see if the app is authorized
    BOOL canUseLocationNotifications = (status == kCLAuthorizationStatusAuthorizedWhenInUse);
    
    if (canUseLocationNotifications) {
        [self startShowingNotifications]; // Custom method defined below
    }
}

-(void)startShowingNotifications {
    
    UILocalNotification *locNotification = [[UILocalNotification alloc] init];
    locNotification.alertBody = @"You have arrived!";
    locNotification.regionTriggersOnce = YES;
    
//    locNotification.region = [[CLCircularRegion alloc]
//                              initWithCenter:LOC_
//                              radius:LOC_RADIUS
//                              identifier:LOC_IDENTIFIER];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:locNotification];
}

// registering for remote notification with the website
//https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/IPhoneOSClientImp.html

//- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
//    const void *devTokenBytes = [devToken bytes];
//    self.registered = YES;
//    [self sendProviderDeviceToken:devTokenBytes]; // custom method
//}
//
//- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
//    NSLog(@"Error in registration. Error: %@", err);
//}

- (void)setMinimumBackgroundFetchInterval:(NSTimeInterval)minimumBackgroundFetchInterval {
    //The minimum number of seconds that must elapse before another background fetch can be initiated. This value is advisory only and does not indicate the exact amount of time expected between fetch operations.
    //This property has no effect for apps that do not have the UIBackgroundModes key with the fetch value in its Info.plist file.
    //The default fetch interval for apps is UIApplicationBackgroundFetchIntervalNever. Therefore, you must call this method and set a fetch interval before your app is given background execution time.
    
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

- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
