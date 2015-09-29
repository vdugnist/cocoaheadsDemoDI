//
//  WFCConfigurator.m
//  WeatherForecastDI
//
//  Created by Vladislav Dugnist on 29/09/15.
//  Copyright © 2015 Vladislav Dugnist. All rights reserved.
//

#import "WFCConfigurator.h"
#import "WFCWeatherServiceProtocol.h"
#import "WFCOpenWeatherService.h"
#import "WFCLocalWeatherService.h"
#import "WFCViewController.h"
#import <BloodMagic/BMInitializer+Injectable.h>

@implementation WFCConfigurator

+ (void)load
{
    BMInitializer *weatherServiceInitializer = [BMInitializer injectableInitializer];

    weatherServiceInitializer.containerClass = [WFCViewController class];
    weatherServiceInitializer.protocols = @[@protocol(WFCWeatherServiceProtocol)];
    weatherServiceInitializer.initializer = ^id (id sender) {
        return [WFCLocalWeatherService new];
    };
    
    [weatherServiceInitializer registerInitializer];
}

@end
