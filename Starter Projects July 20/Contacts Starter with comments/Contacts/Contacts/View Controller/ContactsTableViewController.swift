//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Andrew R Madsen on 10/9/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    let contactsController = ContactsController()
    
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsController.contacts.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = contactsController.contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.relationship
        
		return cell
	}
}
