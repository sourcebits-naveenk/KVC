//
//  Student.m
//  KVC
//
//  Created by Naveen Katari on 14/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "Student.h"

@implementation Student

-(instancetype) init
{
    self = [super init];
    if(self)
    {
        self.strStudentName = @"";
        self.strStudentClass = @"";
        self.strStudentAge = @"";
        
    }
    return self;
}
@end
