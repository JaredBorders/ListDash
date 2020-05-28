//
//  ViewController.swift
//  ListDash
//
//  Created by Jared Borders on 5/26/20.
//  Copyright © 2020 Jared Borders. All rights reserved.
//

import UIKit
import ChameleonFramework

class CategoryViewController: UIViewController {
    
    var tempArray = ["Homework", "Work", "Home", "Reading", "Shopping"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = K.backgroundColor
        tableView.backgroundColor = K.backgroundColor
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.categoryCellNibName, bundle: nil), forCellReuseIdentifier: K.categoryCellReuseIdentifier)
    }
    
    //MARK: - Add Category
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            if let text = textField.text {
                self.tempArray.append(text)
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

}

//MARK: - Table View Data Source Methods

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryCellReuseIdentifier, for: indexPath) as! Cell
        
        cell.delegate = self
        cell.index = indexPath
        
        cell.label.text = tempArray[indexPath.row]
        
        return cell
    }
}

//MARK: - Custom Cell Delegate Methods

extension CategoryViewController: CellDelegate {

    func didPressDelete() {
        
    }
    
    func didPressItems(atIndex index: Int) {
        performSegue(withIdentifier: K.toItemsSegueID, sender: self)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //let destinationVC = segue.destination as! ItemsViewController

    }
    
}
