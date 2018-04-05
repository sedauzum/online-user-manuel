//
//  CategoryItemViewController.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 5.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class CategoryItemViewController: UIViewController {
    
    @IBOutlet weak var categoryItemTableView: UITableView!
    
    var category: GuideCategory!
    var guide: DriverGuide!
    
    var itemArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationBar()
        createMenuItems()
        prepareTableView()
    }
    
    fileprivate func prepareNavigationBar(){
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.setTitle(title: guide.title, subtitle: category.title)

    }
    
    fileprivate func createMenuItems(){
        
        let string1 = "Sesli Komut Sistemi"
        let string2 = "Genel Ayarlar"
        
        itemArray.append(string1)
        itemArray.append(string2)
        
    }
    
    
    fileprivate func prepareTableView(){
        
        categoryItemTableView.delegate = self
        categoryItemTableView.dataSource = self
        categoryItemTableView.register(UINib(nibName: "CategoryItemTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryItemTableViewCell")
        
    }
    
    func showDetail(ofItemAt index: Int){
        
        let storyboard = UIStoryboard(name: "Menu", bundle: nil)
        
        guard let categoryItemViewController = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewController") as? ItemDetailViewController else {
            return
        }
        
        categoryItemViewController.item = itemArray[index]
        categoryItemViewController.category = category
        
        self.navigationController?.pushViewController(categoryItemViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CategoryItemViewController:UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        showDetail(ofItemAt: index)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: CategoryItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoryItemTableViewCell") as? CategoryItemTableViewCell else {
            return  UITableViewCell()
        }
        
        let itemAtIndex = itemArray[indexPath.row]
        
        cell.categoryItemLabel.text = itemAtIndex
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
}

