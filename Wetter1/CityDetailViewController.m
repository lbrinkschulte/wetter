//
//  CityDetailViewController.m
//  Wetter1
//
//  Created by Volker Funke on 18.08.15.
//  Copyright © 2015 Volker Funke. All rights reserved.
//

#import "CityDetailViewController.h"

@interface CityDetailViewController ()
@property NSString *detailString;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"City Weather";
    self.detailLabel.text = self.detailString;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)setDetail:(NSString *)detail {
    self.detailString = detail;
}
@end
