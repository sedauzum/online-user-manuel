//
//  GuideCategoriesViewController.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 3.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class GuideCategoriesViewController: UIViewController {

    @IBOutlet weak var guideCategoryTableView: UITableView!
    
    var guide: DriverGuide!
    var model: VehicleModel!
    
    var categoryArray: [GuideCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationBar()
        createMenuItems()
        prepareTableView()
    }
    
    
    fileprivate func prepareNavigationBar(){
        
        navigationItem.setTitle(title: model.name   , subtitle: guide.title)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    fileprivate func createMenuItems(){
        
        let bilgiler = GuideCategory(title: "Bilgiler", imageView: UIImage(named: "fordtruck")!, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ultrices, dui et condimentum finibus, eros arcu ultrices turpis, quis mattis eros sapien nec ante.")
        let kullanim = GuideCategory(title: "Kullanım Olanakları", imageView: UIImage(named: "fordtruck")!, description: "Praesent euismod tempor sapien quis finibus. Vivamus id lacus eu dui gravida laoreet. Donec rhoncus justo ut eros mattis posuere.")
        
        categoryArray.append(bilgiler)
        categoryArray.append(kullanim)
        
    }
    
    fileprivate func prepareTableView(){
        
        guideCategoryTableView.delegate = self
        guideCategoryTableView.dataSource = self
        guideCategoryTableView.register(UINib(nibName: "GuideCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "GuideCategoryTableViewCell")
        
    }
    
    func showDetail(ofCategoryAt index: Int){
        
        let storyboard = UIStoryboard(name: "Menu", bundle: nil)
        
        guard let guideCategoriesViewController = storyboard.instantiateViewController(withIdentifier: "CategoryItemViewController") as? CategoryItemViewController else {
            return
        }
        
        guideCategoriesViewController.category = categoryArray[index]
        guideCategoriesViewController.guide = guide
        
        self.navigationController?.pushViewController(guideCategoriesViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GuideCategoriesViewController:UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        showDetail(ofCategoryAt: index)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: GuideCategoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GuideCategoryTableViewCell") as? GuideCategoryTableViewCell else {
            return  UITableViewCell()
        }
        
        let categoryAtIndex = categoryArray[indexPath.row]
        
        cell.guideCategoryLabel.text = categoryAtIndex.title
        cell.guideCategoryImageView.image = categoryAtIndex.imageView
        cell.guideCategoryExpLabel.text = categoryAtIndex.description
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    
}

