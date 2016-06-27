//
//  ViewController.h
//  CoreDataDemo
//
//  Created by Genming Zhao on 2016-06-27.
//  Copyright © 2016 Genming Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)savebtnPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;

@property (weak, nonatomic) IBOutlet UITextField *lastnameField;

@end

