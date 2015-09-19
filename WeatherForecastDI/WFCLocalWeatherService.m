//
//  WFCLocalWeatherService.m
//  WeatherForecastDI
//
//  Created by Vladislav Dugnist on 19/09/15.
//  Copyright (c) 2015 Vladislav Dugnist. All rights reserved.
//

#import "WFCLocalWeatherService.h"
#import "WFCCityWeather.h"

@implementation WFCLocalWeatherService

- (void)citiesWeatherWithCallback:(WFCArrayCallback)callback
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Weather" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingAllowFragments
                                                           error:nil];
    NSMutableArray *result = [NSMutableArray new];
    [json[@"list"] enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop)
    {
        WFCCityWeather *city = [[WFCCityWeather alloc] initWithDictionary:dict];
        [result addObject:city];
    }];
    
    callback(result, nil);
}

@end
