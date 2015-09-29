//
//  WFCViewController.h
//  WeatherForecastDI
//
//  Created by Vladislav Dugnist on 19/09/15.
//  Copyright (c) 2015 Vladislav Dugnist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BMInjectable.h>

@protocol WFCWeatherServiceProtocol;

@interface WFCViewController : UIViewController <BMInjectable>

@property (nonatomic) id <WFCWeatherServiceProtocol> weatherService;

@end
