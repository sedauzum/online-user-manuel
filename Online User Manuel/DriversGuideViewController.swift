//
//  DriversGuideViewController.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 3.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class DriversGuideViewController: UIViewController {

 
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var carGuideTableView: UITableView!
    
    var guideArray: [DriverGuide] = []
    var model = "Ford Truck"
    var type = "Kamyonlar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        prepareNavigationBar()
        prepareLabel()
        prepareCarImageView()
        createMenuItems()
        prepareTableView()
    }
    
    fileprivate func prepareNavigationBar(){
        
        navigationItem.setTitle(title: type, subtitle: model)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    
    fileprivate func createMenuItems(){
        
        let item1 = DriverGuide(title: "Kullanım Kılavuzu", imageView: UIImage(named: "kullanim")!, type: .kullanimkilavuzu)
        let item2 = DriverGuide(title: "Animasyonlar", imageView: UIImage(named: "animasyon")!, type: .anismasyonlar)
        let item3 = DriverGuide(title: "Hızlı Bağlantılar", imageView: UIImage(named: "hizlibaglanti")!, type: .hizlibaglantilar)
        let item4 = DriverGuide(title: "Kontrol ve ikaz lambaları", imageView: UIImage(named: "kontrol")!, type: .kontrolikaz)
        let item5 = DriverGuide(title: "Sıkça Sorulan Sorular", imageView: UIImage(named: "sss")!, type: .sss)
        let item6 = DriverGuide(title: "Okuma Isareti", imageView: UIImage(named: "okuma")!, type: .okumaisareti)
        
        guideArray.append(item1)
        guideArray.append(item2)
        guideArray.append(item3)
        guideArray.append(item4)
        guideArray.append(item5)
        guideArray.append(item6)
    }
    
    
    fileprivate func prepareLabel(){
        
        carLabel.text = "Ford Truck"
        carLabel.textColor = . white
        carLabel.font = UIFont.systemFont(ofSize: 40.0)
 
    }
    
    fileprivate func prepareCarImageView(){
        
        carImageView.contentMode = .scaleAspectFill
        carImageView.clipsToBounds = true
        
        carImageView.image = UIImage(named: "fordtruck")

    }
    
    fileprivate func prepareTableView(){
        
        carGuideTableView.delegate = self
        carGuideTableView.dataSource = self
        carGuideTableView.register(UINib(nibName: "DriverGuideTableViewCell", bundle: nil), forCellReuseIdentifier: "DriverGuideTableViewCell")
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func showDetail(ofGuideAt index: Int){
        
        let storyboard = UIStoryboard(name: "Menu", bundle: nil)
        
        guard let guideCategoriesViewController = storyboard.instantiateViewController(withIdentifier: "GuideCategoriesViewController") as? GuideCategoriesViewController else {
            return
        }
        
        guideCategoriesViewController.guide = guideArray[index]
        guideCategoriesViewController.model = model
        
        
        self.navigationController?.pushViewController(guideCategoriesViewController, animated: true)
        
        
    }
    
    
}

extension DriversGuideViewController:UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        showDetail(ofGuideAt: index)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: DriverGuideTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DriverGuideTableViewCell") as? DriverGuideTableViewCell else {
            return  UITableViewCell()
        }
        
        let guideAtIndex = guideArray[indexPath.row]

        cell.guideLabel.text = guideAtIndex.title
        cell.guideImageView.image = guideAtIndex.imageView
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guideArray.count
    }
    

}
