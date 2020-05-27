//
//  Cell.swift
//  ListDash
//
//  Created by Jared Borders on 5/26/20.
//  Copyright © 2020 Jared Borders. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var itemsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        label.text = "Deleted"
    }
    
    
    @IBAction func itemsButtonPressed(_ sender: UIButton) {
        label.text = "Items"
    }
    
}
