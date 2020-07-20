//
//  Contact.swift
//  Contacts
//
//  Created by Andrew R Madsen on 10/9/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

// Any function, initializer, or property that needs to be accessed in your Obj-C code must be marked with @objc

/*
 How will this bridge into Obj-C?
    -will a prefix be added?
    - What happensto optionals? (since everything is optional in obj-C)
 */


// In adding (LSIContact) we are giving the class a new name (generally adding a prefix) to be used in objc
@objc (LSIContact)
class Contact: NSObject {
    @objc var name: String
    @objc var relationship: String?
    
    @objc init(name: String, relationship: String?) {
        self.name = name
        self.relationship = relationship
    }
}
