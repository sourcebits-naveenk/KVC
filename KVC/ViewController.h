//
//  ViewController.h
//  KVC
//
//  Created by Naveen Katari on 14/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addViewController.h"
#import "Student.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate,  delgateToTransferData>

@property (weak, nonatomic) IBOutlet UISearchBar *searchStudents;
- (IBAction)buttonSearch:(id)sender;
- (IBAction)buttonAdd:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblCatchException;
@property (weak, nonatomic) IBOutlet UITextField *searchField;

@property (weak, nonatomic) IBOutlet UITableView *tableViewStudentsList;

@end

