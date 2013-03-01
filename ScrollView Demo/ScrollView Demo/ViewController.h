//
//  ViewController.h
//  ScrollView Demo
//
//  Created by Suniket Wagh on 01/03/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewControllerForThreePages;

@interface ViewController : UIViewController
{
    ViewControllerForThreePages *viewControllerForThreePagesOnly;

}
@property (nonatomic, retain) ViewControllerForThreePages *viewControllerForThreePagesOnly;
- (IBAction)goToPage:(id)sender;


@end
