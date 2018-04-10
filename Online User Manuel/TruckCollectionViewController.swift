//
//  TruckCollectionViewController.swift
//  Online User Manuel
//
//  Created by seda üzüm on 6.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit


class TruckCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var type: VehicleType!
    
    var passengerCarList: [VehicleModel]!
    var lcvList: [VehicleModel]!
    var hcvList: [VehicleModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationItem()
        prepareVehicleList()
        
        self.collectionView.register(UINib(nibName:"TruckCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: "TruckCollectionViewCell")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

    }
    
    
    fileprivate func prepareVehicleList(){

        if type.name == "Binek" {
            preparePassengerCarList()
        } else if type.name == "Ticari"{
            prepareLcvList()
        } else if type.name == "Ağır Ticari"{
            prepareHcvList()
        }
    }
    
   
    fileprivate func preparePassengerCarList(){
        
        let fiesta = VehicleModel(name: "Yeni Fiesta", image: UIImage(named: "fordfocuswhite")!)
        let focus = VehicleModel(name: "Focus", image: UIImage(named: "fordfocuswhite")!)
        let mondeo = VehicleModel(name: "Mondeo", image: UIImage(named: "fordfocuswhite")!)
        let ecosport = VehicleModel(name: "Yeni Ecosport", image: UIImage(named: "fordfocuswhite")!)
        let kuga = VehicleModel(name: "Yeni Kuga", image: UIImage(named: "fordfocuswhite")!)
        let edge = VehicleModel(name: "Edge", image: UIImage(named: "fordfocuswhite")!)
        let cMax = VehicleModel(name: "C-Max", image: UIImage(named: "fordfocuswhite")!)
        let sMax = VehicleModel(name: "S-Max", image: UIImage(named: "fordfocuswhite")!)
        let galaxy = VehicleModel(name: "Galaxy", image: UIImage(named: "fordfocuswhite")!)
        let mustang = VehicleModel(name: "Yeni Mustang", image: UIImage(named: "fordfocuswhite")!)
        
        passengerCarList = [fiesta,focus,mondeo,ecosport,kuga,edge,cMax,sMax,galaxy,mustang]

    }
    
    fileprivate func prepareLcvList(){
        
        let tourneoCourier = VehicleModel(name: "Tourneo Courier", image: UIImage(named: "fordtourneocustom")!)
        let tourneoConnect = VehicleModel(name: "Tourneo Connect", image: UIImage(named: "fordtourneocustom")!)
        let tourneoCustom = VehicleModel(name: "Tourneo Custom", image: UIImage(named: "fordtourneocustom")!)
        let transitCourier = VehicleModel(name: "Transit Courier", image: UIImage(named: "fordtourneocustom")!)
        let transitConnect = VehicleModel(name: "Transit Connect", image: UIImage(named: "fordtourneocustom")!)
        let transitCustom = VehicleModel(name: "Transit Custom", image: UIImage(named: "fordtourneocustom")!)
        let transitVan = VehicleModel(name: "Transit Van", image: UIImage(named: "fordtourneocustom")!)
        let transitKamyonet = VehicleModel(name: "Transit Kamyonet", image: UIImage(named: "fordtourneocustom")!)
        let ranger = VehicleModel(name: "Ranger", image: UIImage(named: "fordtourneocustom")!)

        lcvList = [tourneoCourier,tourneoConnect,tourneoCustom,transitCourier,transitConnect,transitCustom,transitVan,transitKamyonet,ranger]
        
    }
    
    
    fileprivate func prepareHcvList() {
        
        let tractor = VehicleModel(name: "Tractor", image: UIImage(named: "fordcargotractor")!)
        let roadTruck = VehicleModel(name:"Road Truck", image: UIImage(named: "fordcargoroadtruck")!)
        let construction = VehicleModel(name: "Construction", image: UIImage(named: "fordcargoconstruction")!)
        
        hcvList = [tractor, roadTruck, construction]
        
    }

    fileprivate func prepareNavigationItem() {
        navigationItem.title = "Vehicle Type"
    }

    func showDetail(_ index: Int) {
        let storyboard  = UIStoryboard(name:"Menu", bundle:nil)
        guard let driverGuideViewController = storyboard.instantiateViewController(withIdentifier: "DriversGuideViewController") as? DriversGuideViewController else {
            return
        }
        
        self.navigationController?.pushViewController(driverGuideViewController, animated: true)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if type.name == "Binek" {
            return passengerCarList.count
        } else if type.name == "Ticari"{
           return lcvList.count
        } else if type.name == "Ağır Ticari"{
            return hcvList.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TruckCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TruckCollectionViewCell", for: indexPath)as? TruckCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if type.name == "Binek" {
            cell.truckCollectionCellLabel.text = passengerCarList[indexPath.row].name
            cell.truckCollectionCellImageView.image = passengerCarList[indexPath.row].image
        } else if type.name == "Ticari"{
            cell.truckCollectionCellLabel.text = lcvList[indexPath.row].name
            cell.truckCollectionCellImageView.image = lcvList[indexPath.row].image
        } else if type.name == "Ağır Ticari"{
            cell.truckCollectionCellLabel.text = hcvList[indexPath.row].name
            cell.truckCollectionCellImageView.image = hcvList[indexPath.row].image
    }
        

    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.bounds.size.width/2 - 16 , height: view.bounds.size.width/2 - 16)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.row
        showDetail(index)
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    

}

