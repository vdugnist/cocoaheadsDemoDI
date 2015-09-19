//
//  WFCCityWeather.h
//  WeatherForecastDI
//
//  Created by Vladislav Dugnist on 19/09/15.
//  Copyright (c) 2015 Vladislav Dugnist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFCCityWeather : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *celsiusTemperature;

@end
