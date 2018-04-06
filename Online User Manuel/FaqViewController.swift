//
//  FaqViewController.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 6.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class FaqViewController: UIViewController {

    var faqArray: [FaqQuestion] = []
    
    var guide: DriverGuide!
    var model: String = ""

    @IBOutlet weak var faqTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationBar()
        createMenuItems()
        prepareTableView()

    }
    
    fileprivate func prepareNavigationBar(){
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = guide.title
        
    }
    
    fileprivate func createMenuItems(){
        
        let lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id tellus ultricies, euismod felis nec, fringilla ex. Nullam consequat nunc et eros efficitur, quis porta lacus vestibulum. Quisque sollicitudin libero mauris, vitae consectetur metus ultrices in. Cras id semper neque. Praesent interdum faucibus sapien id laoreet. Cras eu erat et massa rhoncus faucibus. Vestibulum dolor mi, facilisis eu ligula ut, ullamcorper tincidunt ex. Phasellus tristique nunc laoreet, ullamcorper nibh ac, mattis felis. Sed gravida mattis rutrum. Maecenas porta pulvinar nisi, in aliquam diam pretium eget. Vivamus consectetur sapien vitae lorem vestibulum, eget ultrices nibh condimentum. Donec pretium erat a urna rutrum posuere. Suspendisse quis vehicula massa, non varius ex. Ut vitae nulla mattis turpis tristique venenatis. In viverra ipsum id justo tincidunt volutpat. Morbi dignissim leo nulla, varius iaculis lacus ultrices ac.Ut ultrices enim ac risus vestibulum eleifend ac sed mauris. Curabitur eget tellus nec lacus laoreet faucibus in a magna. Nunc at nisl ac nulla ultricies pretium. Quisque sed sem tristique, porta orci condimentum, sodales augue. Vestibulum suscipit aliquet augue, et cursus lectus dignissim eget. Vestibulum a turpis tortor. Praesent sed blandit metus.Cras molestie consectetur imperdiet. Etiam condimentum euismod dapibus. Quisque sit amet leo velit. Curabitur nisi est, blandit ac finibus at, egestas a dolor. Cras imperdiet sit amet nisi nec semper. Pellentesque id eros commodo, pharetra ligula bibendum, finibus diam. Quisque eget tellus quis odio egestas bibendum sit amet et justo. Duis ornare justo nec semper sollicitudin. Suspendisse at ipsum vitae lorem ultricies vulputate. Sed mi mauris, vulputate quis varius ut, ultricies non sapien. Donec sit amet tempus quam. Sed at pellentesque turpis, eget vulputate orci."
        
        
        
        
        let q1 = FaqQuestion(question: "Araba nedir, nasil kullanilir?", answer: lorem, questionID: "q1")
        let q2 = FaqQuestion(question: "Babam böyle pasta yapmayı nerden öğrendi?", answer: lorem, questionID: "q2")

        
        faqArray.append(q1)
        faqArray.append(q2)
        
    }
    
    
    
    fileprivate func prepareTableView(){
        
        faqTableView.delegate = self
        faqTableView.dataSource = self
        faqTableView.register(UINib(nibName: "CategoryItemTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryItemTableViewCell")
        
    }
    
    func showDetail(ofItemAt index: Int){
        
        let storyboard = UIStoryboard(name: "Menu", bundle: nil)

        guard let faqAnswerViewController = storyboard.instantiateViewController(withIdentifier: "FaqAnswerViewController") as? FaqAnswerViewController else {
            return
        }

        faqAnswerViewController.question = faqArray[index]
        faqAnswerViewController.guide = guide

        self.navigationController?.pushViewController(faqAnswerViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FaqViewController:UITableViewDelegate, UITableViewDataSource {
    
    
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
        
        let itemAtIndex = faqArray[indexPath.row]
        
        cell.categoryItemLabel.text = itemAtIndex.question
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqArray.count
    }
    
    
}

