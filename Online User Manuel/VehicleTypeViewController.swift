//
//  VehicleTypeViewController.swift
//  Online User Manuel
//
//  Created by seda üzüm on 5.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class VehicleTypeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var shoppingList = ["elma", "armut", "ıspanak", "tursu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareNavigationItem()
        prepareTableView()
        
    }
    
    fileprivate func prepareTableView() {
        tableView.register(UINib(nibName:"VehicleTypeTableViewCell", bundle:nil), forCellReuseIdentifier:"VehicleTypeTableViewCell" )
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate func prepareNavigationItem() {
        
        navigationItem.title = "Vehicle Type"
    }

}

extension VehicleTypeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: VehicleTypeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VehicleTypeTableViewCell") as! VehicleTypeTableViewCell
        
        cell.vehicleTypeLabel.text = shoppingList[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}
