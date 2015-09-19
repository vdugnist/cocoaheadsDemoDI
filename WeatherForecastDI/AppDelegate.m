//
//  AppDelegate.m
//  WeatherForecastDI
//
//  Created by Vladislav Dugnist on 19/09/15.
//  Copyright (c) 2015 Vladislav Dugnist. All rights reserved.
//

#import "AppDelegate.h"
#import "WFCViewController.h"
#import "WFCOpenWeatherService.h"
#import "WFCLocalWeatherService.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    WFCViewController *vc = (WFCViewController*)self.window.rootViewController;
    vc.weatherService = [WFCLocalWeatherService new];
    
    return YES;
}

@end
