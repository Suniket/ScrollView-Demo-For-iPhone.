//
//  ViewControllerForThreePages.m
//  ScrollView Demo
//
//  Created by Suniket Wagh on 01/03/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "ViewControllerForThreePages.h"

@interface ViewControllerForThreePages ()

@end

@implementation ViewControllerForThreePages

@synthesize scrollView;
@synthesize documentTitles;
@synthesize pageOneDoc, pageTwoDoc, pageThreeDoc;
@synthesize prevIndex, currIndex, nextIndex;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    documentTitles = [[NSMutableArray alloc] init];
	
	// create our array of documents
	for (int i = 0; i < 10; i++) {
		[documentTitles addObject:[NSString stringWithFormat:@"Document %i",i+1]];
	}
	
	// create placeholders for each of our documents
	pageOneDoc = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	pageTwoDoc = [[UILabel alloc] initWithFrame:CGRectMake(320, 0, 320, 44)];
	pageThreeDoc = [[UILabel alloc] initWithFrame:CGRectMake(640, 0, 320, 44)];
	
	pageOneDoc.textAlignment = UITextAlignmentCenter;
	pageTwoDoc.textAlignment = UITextAlignmentCenter;
	pageThreeDoc.textAlignment = UITextAlignmentCenter;
	
	// load all three pages into our scroll view
	[self loadPageWithId:9 onPage:0];
	[self loadPageWithId:0 onPage:1];
	[self loadPageWithId:1 onPage:2];
	
	[scrollView addSubview:pageOneDoc];
	[scrollView addSubview:pageTwoDoc];
	[scrollView addSubview:pageThreeDoc];
	
	// adjust content size for three pages of data and reposition to center page
	scrollView.contentSize = CGSizeMake(960, 416);
	[scrollView scrollRectToVisible:CGRectMake(320,0,320,416) animated:NO];
}

- (void)loadPageWithId:(int)index onPage:(int)page {
	// load data for page
	switch (page) {
		case 0:
			pageOneDoc.text = [documentTitles objectAtIndex:index];
			break;
		case 1:
			pageTwoDoc.text = [documentTitles objectAtIndex:index];
			break;
		case 2:
			pageThreeDoc.text = [documentTitles objectAtIndex:index];
			break;
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender {
	// All data for the documents are stored in an array (documentTitles).
	// We keep track of the index that we are scrolling to so that we
	// know what data to load for each page.
	if(scrollView.contentOffset.x > scrollView.frame.size.width) {
		// We are moving forward. Load the current doc data on the first page.
		[self loadPageWithId:currIndex onPage:0];
		// Add one to the currentIndex or reset to 0 if we have reached the end.
		currIndex = (currIndex >= [documentTitles count]-1) ? 0 : currIndex + 1;
		[self loadPageWithId:currIndex onPage:1];
		// Load content on the last page. This is either from the next item in the array
		// or the first if we have reached the end.
		nextIndex = (currIndex >= [documentTitles count]-1) ? 0 : currIndex + 1;
		[self loadPageWithId:nextIndex onPage:2];
	}
	if(scrollView.contentOffset.x < scrollView.frame.size.width) {
		// We are moving backward. Load the current doc data on the last page.
		[self loadPageWithId:currIndex onPage:2];
		// Subtract one from the currentIndex or go to the end if we have reached the beginning.
		currIndex = (currIndex == 0) ? [documentTitles count]-1 : currIndex - 1;
		[self loadPageWithId:currIndex onPage:1];
		// Load content on the first page. This is either from the prev item in the array
		// or the last if we have reached the beginning.
		prevIndex = (currIndex == 0) ? [documentTitles count]-1 : currIndex - 1;
		[self loadPageWithId:prevIndex onPage:0];
	}
	
	// Reset offset back to middle page
	[scrollView scrollRectToVisible:CGRectMake(320,0,320,416) animated:NO];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
