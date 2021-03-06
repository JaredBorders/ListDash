//
//  Cell.swift
//  ListDash
//
//  Created by Jared Borders on 5/26/20.
//  Copyright © 2020 Jared Borders. All rights reserved.
//

import UIKit

protocol CellDelegate {
    func didPressDelete(atIndex index: Int)
    func didPressItems(atIndex index: Int)
}

class Cell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var itemsButton: UIButton!
    
    var delegate: CellDelegate?
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
    }
    
    
    @IBAction func itemsButtonPressed(_ sender: UIButton) {
        delegate?.didPressItems(atIndex: (index!))        
    }
    
}
