//
//  ViewController.m
//  KVC
//
//  Created by Naveen Katari on 14/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "ViewController.h"
#import "addViewController.h"

@interface ViewController () {
    NSArray *indexArray ;
    NSArray *tempStudentData;
    NSArray *searchResults;
    NSMutableArray *arrayData;
    Student *stud;
}

@end
NSMutableArray *stu;
static NSInteger *rowCount;

@implementation ViewController

- (void)viewDidLoad

{
    [super viewDidLoad];
    
    stu = [[NSMutableArray alloc]init];
    _tableViewStudentsList.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableViewStudentsList.estimatedRowHeight = 44.0;
    _tableViewStudentsList.rowHeight = UITableViewAutomaticDimension;
    stud = [[Student alloc]init];
    
    arrayData = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    if (_tableViewStudentsList != nil) {
        [_tableViewStudentsList reloadData ];
    }
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ stu count ];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"addDetails"]) {
        addViewController *addVC = (addViewController*)[segue destinationViewController];
        addVC.delegate = self;

    }
}
-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"transferCellData"])
    {
        addViewController *addVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addViewController"];
        addVC.delegate = self;
        addVC.arrayHoldRowId = indexArray;
        [self.navigationController pushViewController:addVC animated:YES];
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (newCell == nil)
    {
        newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
   

    newCell.textLabel.text = [stu objectAtIndex:indexPath.row];
    
    newCell.textLabel.numberOfLines = 0;
    return newCell;
}

-(void)addItemViewController:(Student *)studentData
{
    
    [arrayData addObject:studentData];
    [stu addObject:studentData.strStudentName];
    [_tableViewStudentsList reloadData];
}
 
- (void)editItemViewController: (Student *) studentData {
    [stu setObject:studentData.strStudentName atIndexedSubscript:rowCount];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    rowCount = indexPath.row;
    
    indexArray = [arrayData objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"transferCellData" sender:self];
}

- (IBAction)buttonSearch:(id)sender
{
    [_tableViewStudentsList reloadData];
    //if (![_searchField.text isEqualToString:@""])
        _lblCatchException.text = @"";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"strStudentName like [cd] %@", _searchField.text];
        NSArray *filteredArr = [stu filteredArrayUsingPredicate:pred];
    if([filteredArr count] != nil) {
        [stu removeAllObjects];
    
        [stu addObject:filteredArr[0]];
        
        [_tableViewStudentsList reloadData];
    }
    else
    {
        _lblCatchException.text = @"No match found";
    }
        
}


- (IBAction)buttonAdd:(id)sender
{
   
}

@end
