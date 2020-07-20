//
//  LSIContactsController.m
//  Contacts
//
//  Created by Andrew R Madsen on 10/9/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIContactsController.h"
/*
 If you need to find the name of the automatically generated header file for the Swift you want to use in your Obj-C code, it is going to be the name of your project and "-Swift.h".
 For example "Journal-Swift.h".
 If your project has spaces in the name, they will be converted to underscores instead. For example, the header made for the project named "Hybrid Star Wars Search" would be "Hybrid_Star_Wars_Search-Swift.h".
 */
#import "Contacts-Swift.h"

@implementation LSIContactsController

-(instancetype)init
{
    self = [super init];
    if (self) {
        _contacts = @[[[LSIContact alloc]initWithName: @"Cody" relationship: @"Myself"],
                      [[LSIContact alloc]initWithName: @"Dylan" relationship: @"Brother"]
        ];
    }
    return self;
}

@end

