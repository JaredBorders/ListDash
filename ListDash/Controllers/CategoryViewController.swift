//
//  ViewController.swift
//  ListDash
//
//  Created by Jared Borders on 5/26/20.
//  Copyright © 2020 Jared Borders. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    var selectedIndex: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
        view.backgroundColor = K.backgroundColor
        tableView.backgroundColor = K.backgroundColor
        
        tableView.dataSource = self
        tableView.register(UINib(nibName:
            K.categoryCellNibName, bundle: nil), forCellReuseIdentifier: K.categoryCellReuseIdentifier)
    }
    
    //MARK: - Add Category
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            if let text = textField.text {
                
                let newCategory = Category()
                
                newCategory.name = text
                
                // self.categories.append(newCategory)
                // The Results data type is auto-updating. Above code is unnecessary.
                
                self.saveCategories(category: newCategory)
                
            }
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "New Category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Save & Load
    
    func saveCategories(category: Category) {
        do {
            
            try realm.write {
                realm.add(category)
            }
            
        } catch {
            print("Error Saving: \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
    }
    
}

//MARK: - Table View Data Source Methods

extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            K.categoryCellReuseIdentifier, for: indexPath) as! Cell
        
        cell.delegate = self
        cell.index = indexPath.row
        
        cell.label.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        
        return cell
    }
    
}

//MARK: - Custom Cell Delegate Methods

extension CategoryViewController: CellDelegate {
    
    func didPressDelete(atIndex index: Int) {
        
        if let category = categories?[index] {
            do {
                try realm.write {
                    realm.delete(category)
                }
            } catch {
                print("Error Deleting Category: \(error)")
            }
        }
        
        tableView.reloadData()
        
    }
    
    func didPressItems(atIndex index: Int) {
        selectedIndex = index
        performSegue(withIdentifier: K.toItemsSegueID, sender: self)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ItemsViewController
        
        guard let safeIndex = selectedIndex else { fatalError() }
        destinationVC.selectedCategory = categories?[safeIndex]
        
        
    }
    
}
