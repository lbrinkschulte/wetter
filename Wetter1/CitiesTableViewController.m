//
//  CitiesTableViewController.m
//  Wetter1
//
//  Created by Volker Funke on 18.08.15.
//  Copyright © 2015 Volker Funke. All rights reserved.
//

#import "CitiesTableViewController.h"

#import "CityDetailViewController.h"
#import "URLReader.h"

@interface CitiesTableViewController ()
@end

@implementation CitiesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Cities";
    URLReader *reader = [URLReader urlReader];
    NSURL *hamelnURL = [URLReader urlForCity:@"Hameln" andCountry:@"DE"];
    void (^handler)(NSDictionary *) = ^(NSDictionary *dict) {
        NSNumber *temp =[dict valueForKeyPath:@"main.temp"];
        NSNumber *luftdruck =[dict valueForKeyPath:@"main.pressure"];
        NSNumber *longitude =[dict valueForKeyPath:@"coord.lon"];
        NSNumber *latitude =[dict valueForKeyPath:@"coord.lat"];
        
        NSLog(@"temperatur: %f °C", temp.floatValue-273.15f);
        NSLog(@"Luftdruck: %f hP", luftdruck.floatValue);
        NSLog(@"Längengrad: %f", longitude.floatValue);
        NSLog(@"Breitengrad: %f", latitude.floatValue);
    };
    [reader queryAsyncURL:hamelnURL handler:handler];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView : (UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1000000;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    cell.textLabel.text = [NSString stringWithFormat:@"Stadt %ld", row ];
    cell.detailTextLabel.text = @"28°C";
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [segue.identifier isEqualToString:@"showCityWeather"] ) {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        [segue.destinationViewController setDetail:[NSString stringWithFormat:@"Stadt %ld", path.row]];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
