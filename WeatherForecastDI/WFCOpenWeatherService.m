//
//  WeatherService.m
//  WeatherForecastDI
//
//  Created by Vladislav Dugnist on 19/09/15.
//  Copyright (c) 2015 Vladislav Dugnist. All rights reserved.
//

#import "WFCOpenWeatherService.h"
#import "WFCCityWeather.h"

@implementation WFCOpenWeatherService


+ (instancetype)sharedInstance
{
    static WFCOpenWeatherService *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [WFCOpenWeatherService new];
    });
    
    return instance;
}

- (void)citiesWeatherWithCallback:(WFCArrayCallback)callback
{
    NSAssert(callback, @"Callback is required");
    
    NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/group?id=524901,498817,2950159,2643743,5380748&units=metric"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if (connectionError) {
            callback(nil, connectionError);
            return;
        }
        
        NSError *serializationError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&serializationError];
        NSAssert(!serializationError, @"Unable to serialize");
        
        NSMutableArray *result = [NSMutableArray new];
        
        [dictionary[@"list"] enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            WFCCityWeather *city = [[WFCCityWeather alloc] initWithDictionary:obj];
            [result addObject:city];
        }];
        
        callback(result, nil);
    }];
}


@end
