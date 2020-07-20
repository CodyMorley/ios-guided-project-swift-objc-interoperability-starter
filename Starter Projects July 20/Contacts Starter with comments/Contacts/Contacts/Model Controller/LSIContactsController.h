//
//  LSIContactsController.h
//  Contacts
//
//  Created by Andrew R Madsen on 10/9/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIContact;

// Add a name for this contact controller to be bridged into swift as. Generally this will be the name of the class minus the prefix

NS_SWIFT_NAME(ContactsController)
@interface LSIContactsController : NSObject

/*annotating for nullability (optionality)
    -nullable = optional
    -nonnull means non optional
*/
@property (nonatomic, readonly, nonnull) NSArray <LSIContact *> *contacts;

@end
