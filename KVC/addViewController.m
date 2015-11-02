//
//  addViewController.m
//  KVC
//
//  Created by Naveen Katari on 14/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "addViewController.h"

@interface addViewController ()
{
    NSMutableArray *arrayStudent;
    //NSMutableArray *arrayClass;
   // NSMutableArray *arrayAge;
    //Student *student;
}

@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   _student = [[Student alloc]init];
    arrayStudent =[[NSMutableArray alloc]init];
    //arrayClass = [[NSMutableArray alloc] init];
    //arrayAge = [[NSMutableArray alloc] init];
    
        //self.testArray = [NSArray arrayWithArray:arrayStudent];
    NSLog(@"Arr %@", _arrayHoldRowId);
    
    if(_arrayHoldRowId != nil)
    {
        _student = _arrayHoldRowId;
    
    _textFieldName.text = _student.strStudentName;
    _textFieldClass.text = _student.strStudentClass;
    _textFieldAge.text = _student.strStudentAge;
    }

    [self addObserver:self forKeyPath:@"student.strStudentName" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"student.strStudentClass" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"student.strStudentAge" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
    //self.delegate = self;
    
}

//ObserveValueForKeyPath method will observe the changes that are done
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSMutableArray *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"student.strStudentName"]) {
        NSLog(@"Student name is changed.\n");
        NSLog(@"%@", change);
        
    }
    if ([keyPath isEqualToString:@"student.strStudentClass"]) {
        NSLog(@"Student class has been updated.\n");
        NSLog(@"%@", change);
    }
    
    if ([keyPath isEqualToString:@"student.strStudentAge"]) {
        NSLog(@"Age of the student is changed.\n");
        NSLog(@"%@", change);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Action for Save button that saves the form details and send back to the main View Controller
- (IBAction)buttonSave:(id)sender
{
    
    [self.student setValue:_textFieldName.text forKey:@"strStudentName"];
    [self.student setValue:_textFieldClass.text forKey:@"strStudentClass"];
    [self.student setValue:_textFieldAge.text forKey:@"strStudentAge"];
    
    if(_arrayHoldRowId == nil) {
        [[self delegate] addItemViewController:self.student];
    }
    else {
        [[self delegate] editItemViewController: self.student];
    }
    
    [self removeObserver:self forKeyPath:@"student.strStudentName"  context:nil];
    [self removeObserver:self forKeyPath:@"student.strStudentClass"  context:nil];
    [self removeObserver:self forKeyPath:@"student.strStudentAge"  context:nil];
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
//Action for Cancel button that take you back to the main View Controller
- (IBAction)backButton:(id)sender {
    
    [self removeObserver:self forKeyPath:@"student.strStudentName"  context:nil];
    [self removeObserver:self forKeyPath:@"student.strStudentClass"  context:nil];
    [self removeObserver:self forKeyPath:@"student.strStudentAge"  context:nil];
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
