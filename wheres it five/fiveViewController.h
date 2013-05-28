//
//  fiveViewController.h
//  wheres it five
//
//  Created by Blackbook on 13-05-22.
//  Copyright (c) 2013 Ben-Church. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fiveViewController : UIViewController
{
    int timeIndex;
    NSDateFormatter *formatter;
    NSString *dateString;
    
    NSMutableArray *locations;
    
    //view objects
    IBOutlet UILabel *locationField;
    
    
}

- (IBAction)findLocation:(id)sender;
@end
