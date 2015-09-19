//
//  WFCViewController.m
//  WeatherForecastDI
//
//  Created by Vladislav Dugnist on 19/09/15.
//  Copyright (c) 2015 Vladislav Dugnist. All rights reserved.
//

#import "WFCViewController.h"
#import "WFCCityWeather.h"
#import "WFCOpenWeatherService.h"

@interface WFCViewController () <UITableViewDataSource>
@property (nonatomic) NSArray *cities;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation WFCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSAssert(_weatherService, @"Weather service required");
    
    __weak typeof(self) wSelf = self;
    
    [_weatherService citiesWeatherWithCallback:^(NSArray *array, NSError *error) {
        wSelf.cities = array;
        [wSelf.tableView reloadData];
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WFCCityWeather *city = _cities[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.celsiusTemperature;
    
    return cell;
}

@end
