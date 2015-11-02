//
//  addViewController.h
//  KVC
//
//  Created by Naveen Katari on 14/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@protocol delgateToTransferData <NSObject>

- (void)addItemViewController: (Student *) studentData;
- (void)editItemViewController: (Student *) studentData;

@end

@interface addViewController : UIViewController

//- (IBAction)buttonSave:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldClass;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAge;
@property (nonatomic) Student *student;
//@property (weak, nonatomic) NSString *stringStdName;
//@property (weak, nonatomic) NSString *stringStdClass;
//@property ( nonatomic) NSUInteger integerAge;
@property (weak, nonatomic) NSArray *arrayHoldRowId;

@property (nonatomic)id <delgateToTransferData> delegate;
@property (nonatomic, retain) NSMutableArray *studentData;

@end
