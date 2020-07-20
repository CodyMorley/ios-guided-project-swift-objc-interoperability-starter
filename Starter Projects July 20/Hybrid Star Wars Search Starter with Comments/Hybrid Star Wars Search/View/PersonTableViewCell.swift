//
//  PersonTableViewCell.swift
//  Hybrid Star Wars Search
//
//  Created by Spencer Curtis on 1/28/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

@objc (LSIPersonTableViewCell)
class PersonTableViewCell: UITableViewCell {

    @objc var person: Person? {
        didSet {
            updateViews()
        }
    }
	
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
	
    private func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        heightLabel.text = "\(person.height / 100)m"
        birthYearLabel.text = person.birthYear
        eyeColorLabel.text = person.eyeColor
    }
    
}
