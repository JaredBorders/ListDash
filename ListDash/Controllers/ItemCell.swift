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
    func didPressCheckMark(atIndex index: Int)
}

class ItemCell: UITableViewCell {
    
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var delegate: ItemCellDelegate?
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        delegate?.didPressDelete(atIndex: index!)
    }
    
    @IBAction func checkMarkButtonPressed(_ sender: UIButton) {
        delegate?.didPressCheckMark(atIndex: index!)
    }
}
