//
//  ViewController.m
//  CoreDataDemo
//
//  Created by Genming Zhao on 2016-06-27.
//  Copyright © 2016 Genming Zhao. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "employee.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSManagedObjectContext *moc = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Employee" inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastname" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    // Fetch the records and handle an error
    NSError *error;
    NSArray *results = [[moc executeFetchRequest:request error:&error] mutableCopy];
    
    if (results) {
        
        Employee* empl=results[0];
        self.lastnameField.text=empl.lastname;
        self.firstNameField.text=empl.firstname;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)savebtnPressed:(id)sender {
    NSManagedObjectContext *moc = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
   Employee* empl= (Employee*)[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:moc];
    empl.lastname=_lastnameField.text;
    empl.firstname=_firstNameField.text;
    
    NSError *error;
    if (![moc save:&error]) {
        // Something's gone seriously wrong
        NSLog(@"Error saving new employee: %@", [error localizedDescription]);
    }

}
@end
