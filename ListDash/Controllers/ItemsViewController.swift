//
//  ItemsViewController.swift
//  ListDash
//
//  Created by Jared Borders on 5/26/20.
//  Copyright © 2020 Jared Borders. All rights reserved.
//

import UIKit
import RealmSwift

class ItemsViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var realm = try! Realm()
    var items: Results<Item>?
    
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = K.backgroundColor
        listTableView.backgroundColor = K.backgroundColor
        
        listTableView.dataSource = self
        listTableView.register(UINib(nibName:
            K.itemCellNibName, bundle: nil), forCellReuseIdentifier: K.itemCellReuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = selectedCategory!.name
    }
    
    //MARK: - Load Items
    
    func loadItems() {
        items = selectedCategory?.items.sorted(byKeyPath: "dateCreated", ascending: true)
    }
    
    //MARK: - Add Category
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            if let currentCatefory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date()
                        currentCatefory.items.append(newItem)
                    }
                } catch {
                    print("Error Saving Items: \(error)")
                }
            }
                        
            self.listTableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

//MARK: - Table View Data Source Methods

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = listTableView.dequeueReusableCell(withIdentifier:
            K.itemCellReuseIdentifier, for: indexPath) as! ItemCell
        
        itemCell.delegate = self
        itemCell.index = indexPath.row
        
        let text = items?[indexPath.row].title ?? "No Items Yet"
        itemCell.label.text = text
        
        return itemCell
    }
}

//MARK: - Custom Item Cell Delegate Methods

extension ItemsViewController: ItemCellDelegate {
    
    func didPressDelete(atIndex index: Int) {
        
        if let item = items?[index] {
            do {
                try realm.write {
                    realm.delete(item)
                }
            } catch {
                print("Error Deleting Item: \(error)")
            }
        }
        
        listTableView.reloadData()
    }
    
}
