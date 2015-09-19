//
//  WFCCityWeather.m
//  WeatherForecastDI
//
//  Created by Vladislav Dugnist on 19/09/15.
//  Copyright (c) 2015 Vladislav Dugnist. All rights reserved.
//

#import "WFCCityWeather.h"

@implementation WFCCityWeather

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _name = dict[@"name"];
        _celsiusTemperature = [NSString stringWithFormat:@"%d°C", [dict[@"main"][@"temp"] intValue]];
    }
    
    return self;
}

@end
