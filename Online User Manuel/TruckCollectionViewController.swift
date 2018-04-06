//
//  TruckCollectionViewController.swift
//  Online User Manuel
//
//  Created by seda üzüm on 6.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

struct TruckType {
    
    var name: String
    var image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}

class TruckCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var truckTypeList: [TruckType]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationItem()
        prepareTruckTypeList()
        
        self.collectionView.register(UINib(nibName:"TruckCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: "TruckCollectionViewCell")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    fileprivate func prepareTruckTypeList() {
        
        let tractor = TruckType(name: "Tractor", image: UIImage(named: "fordcargotractor")!)
        
        let roadTruck = TruckType(name:"Road Truck", image: UIImage(named: "fordcargoroadtruck")!)
        
        let construction = TruckType(name: "Construction", image: UIImage(named: "fordcargoconstruction")!)
        
        truckTypeList = [tractor, roadTruck, construction]
        
    }

    fileprivate func prepareNavigationItem() {
        
        navigationItem.title = "Vehicle Type"
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return truckTypeList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TruckCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TruckCollectionViewCell", for: indexPath)as? TruckCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.truckCollectionCellLabel.text = truckTypeList[indexPath.row].name
        cell.truckCollectionCellImageView.image = truckTypeList[indexPath.row].image
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.bounds.size.width/2 - 16 , height: view.bounds.size.width/2 - 16)
        
    }

}
