//
//  ItemCell.swift
//  ListDash
//
//  Created by Jared Borders on 5/28/20.
//  Copyright © 2020 Jared Borders. All rights reserved.
//

import UIKit

protocol ItemCellDelegate {
    func didPressDelete(atIndex index: Int)
}

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    var delegate: ItemCellDelegate?
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        delegate?.didPressDelete(atIndex: (index!))
        self.label.text = "Delete"
    }
    
}
