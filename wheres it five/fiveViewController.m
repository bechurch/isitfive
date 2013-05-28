//
//  fiveViewController.m
//  wheres it five
//
//  Created by Blackbook on 13-05-22.
//  Copyright (c) 2013 Ben-Church. All rights reserved.
//

#import "fiveViewController.h"

@interface fiveViewController ()

@end

@implementation fiveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Create two arrays and make pointers to point to them
        locations = [[NSMutableArray alloc] init];
        
        //add areas
        [locations addObject: @"Middle of the pacific ocean"];
        [locations addObject: @"Anchorage, Alaska"];
        [locations addObject: @"Whitehorse, Yukon"];
        [locations addObject: @"3"];
        [locations addObject: @"Margarita Ville Mable Lake"];
        [locations addObject: @"Banff, AB"];
        [locations addObject: @"Mexico city and Dallas, TX"];
        [locations addObject: @"Havana, Cuba and Miami, FL"];
        [locations addObject: @"Halifax, Nova Scotia and Rio de Janeiro, Brazil"];
        [locations addObject: @"King Edward Island, Sandwich IL"];
        [locations addObject: @"Praia, Cape Verde"];
        [locations addObject: @"Reykjavik, Iceland and Freetown, Sierra Leone"];
        [locations addObject: @"London, Dublin and Lisbon"];
        [locations addObject: @"Capetown, Prague and Berlin"];
        [locations addObject: @"Istanbul, Turkey and Jerusalem, Israel"];
        [locations addObject: @"Moscow, Russia and Dubai, UAE"];
        [locations addObject: @"The Maldives and Pakistan"];
        [locations addObject: @"Bhutan and Bangladesh"];
        [locations addObject: @"Laos, Vietnam, Thailand, Cambodia and Mongolia"];
        [locations addObject: @"Hong Kong, Beijing and Western Austrailia"];
        [locations addObject: @"North Korea, South Korea, Japan and Eastern Austrailia"];
        [locations addObject: @"Papua New Guinea and the Caroline Islands"];
        [locations addObject: @"Newzealand"];
        [locations addObject: @"Honolulu, Hawai"];

    }
    //Return the address of the new object
    return self;
}

- (IBAction)findLocation:(id)sender
{
    //Step to next question
    timeIndex++;
    
    //Am i past the last question?
    if (timeIndex == [locations count]) {
        //go back to first question
        timeIndex = 0;
    }
    
    //date stuff
    formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH"];
    dateString = [formatter stringFromDate: [NSDate date]];
    
    NSLog(@"displaying time: %@", dateString);
    
    timeIndex = [dateString intValue];
   
    NSNumberFormatter * f = [[NSNumberFormatter alloc]init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSInteger offset;
    
    //time at location
    NSInteger lc = [dateString integerValue];
    
    //time zone
    NSInteger tz = ([[NSTimeZone localTimeZone] secondsFromGMT] / 3600);
    
    NSLog(@"time zone: %d", tz);
    NSLog(@"hours: %d", lc);
    
    //adding 9 to get the timezone to sync up with the array
    tz += 9;

    //if the time at the location is after five then get the offset and remove that from the index
    if (lc>17)
    {
        offset = lc - 17;
        timeIndex = tz - offset;
    }
    
    //if its before 5 then add the offset to find the spot in the array
    else if (lc<17)
    {
        offset = 17-lc;
        timeIndex = tz + offset;
    }
    
    //else if its right on 5 use the timezone for the place in the array
    else
    {
        timeIndex = tz;
    }
    
    //the next two if statements are meant to correct if we've went outside the bounds of the array
    if (tz<0) {
        tz +=24;
    }
    
    if (tz>23) {
        tz -= 24;
    }
    
    
    //Get the string at the index in the question array
    NSString *curLocation = [locations objectAtIndex:timeIndex];
    
    //log the string into the console
    NSLog(@"displaying location: %@", curLocation);
    
    
    
     /*
     NSNumberFormatter * f = [[NSNumberFormatter alloc]init];
     [f setNumberStyle:NSNumberFormatterDecimalStyle];
     NSNumber *myNumber = [f numberFromString: dateString];
     NSInteger fiveZone;
    */
    
    
    //Display the string in the question field
    [locationField setText:curLocation];
    
    
}

@end
