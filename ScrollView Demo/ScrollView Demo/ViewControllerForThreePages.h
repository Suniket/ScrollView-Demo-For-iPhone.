//
//  ViewControllerForThreePages.h
//  ScrollView Demo
//
//  Created by Suniket Wagh on 01/03/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerForThreePages : UIViewController  <UIScrollViewDelegate>
{
    NSMutableArray *documentTitles;
	UILabel *pageOneDoc;
	UILabel *pageTwoDoc;
	UILabel *pageThreeDoc;
	int prevIndex;
	int currIndex;
	int nextIndex;
    
    IBOutlet UIScrollView *scrollView;
}
@property (nonatomic, retain) NSMutableArray *documentTitles;
@property (nonatomic, retain) UILabel *pageOneDoc;
@property (nonatomic, retain) UILabel *pageTwoDoc;
@property (nonatomic, retain) UILabel *pageThreeDoc;
@property (nonatomic) int prevIndex;
@property (nonatomic) int currIndex;
@property (nonatomic) int nextIndex;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

- (void)loadPageWithId:(int)index onPage:(int)page;

@end
