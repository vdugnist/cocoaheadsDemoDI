//
//  WFCWeatherServiceProtocol.h
//  WeatherForecastDI
//
//  Created by Vladislav Dugnist on 19/09/15.
//  Copyright (c) 2015 Vladislav Dugnist. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^WFCArrayCallback)(NSArray *array, NSError *error);

@protocol WFCWeatherServiceProtocol <NSObject>

- (void)citiesWeatherWithCallback:(WFCArrayCallback)callback;

@end
