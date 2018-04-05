//
//  ItemDetailViewController.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 5.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    var category: GuideCategory!
    var item: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareNavigationBar()
    }
    
    fileprivate func prepareNavigationBar(){
        
        navigationItem.setTitle(title: category.title, subtitle: item)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
