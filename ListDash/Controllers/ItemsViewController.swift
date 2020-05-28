//
//  ItemsViewController.swift
//  ListDash
//
//  Created by Jared Borders on 5/26/20.
//  Copyright © 2020 Jared Borders. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    var selectedCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = K.backgroundColor
        listTableView.backgroundColor = K.backgroundColor
        
        listTableView.dataSource = self
        listTableView.register(UINib(nibName: K.itemCellNibName, bundle: nil), forCellReuseIdentifier: K.itemCellReuseIdentifier)
    }
    
}

//MARK: - Table View Data Source Methods

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = listTableView.dequeueReusableCell(withIdentifier: K.itemCellReuseIdentifier, for: indexPath) as! ItemCell
        
        itemCell.delegate = self
        itemCell.index = indexPath.row
        
        guard let text = selectedCategory else { fatalError("selected category not set") }
        itemCell.label.text = text
        
        return itemCell
    }
}

//MARK: - Custom Item Cell Delegate Methods

extension ItemsViewController: ItemCellDelegate {
    
    func didPressDelete(atIndex index: Int) {
        print(index)
    }
    
}
