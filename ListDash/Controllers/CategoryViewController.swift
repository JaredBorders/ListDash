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

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = K.backgroundColor
        tableView.backgroundColor = K.backgroundColor
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.reusableCellID, bundle: nil), forCellReuseIdentifier: K.reusableCellID)
    }
    
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableCellID, for: indexPath)
        return cell
    }
}
