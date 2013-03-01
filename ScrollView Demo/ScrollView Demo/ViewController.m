//
//  ViewController.m
//  ScrollView Demo
//
//  Created by Suniket Wagh on 01/03/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerForThreePages.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToPage:(id)sender {
    
		ViewControllerForThreePages *temp = [[ViewControllerForThreePages alloc] initWithNibName:@"ViewControllerForThreePages" bundle:nil];
        
        [self presentViewController:temp animated:TRUE completion:nil];
	}

@end
