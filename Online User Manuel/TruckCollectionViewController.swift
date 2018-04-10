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
    
    var vehicle: VehicleType!
    
    var vehicleList: [VehicleModel]!
    var passengerCarList: [VehicleModel]!
    var lcvList: [VehicleModel]!
    var hcvList: [VehicleModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationItem()
        prepareCollectionView()
        prepareVehicleList()
    }
    
    fileprivate func prepareCollectionView(){
        self.collectionView.register(UINib(nibName:"TruckCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: "TruckCollectionViewCell")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    
    fileprivate func prepareVehicleList(){

        switch vehicle.type {
            
        case .binek :
            preparePassengerCarList()
        case .ticari:
            prepareLcvList()
        case .agirTicari:
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
        vehicleList = passengerCarList
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
        vehicleList = lcvList
        
    }
    
    
    fileprivate func prepareHcvList() {
        
        let tractor = VehicleModel(name: "Tractor", image: UIImage(named: "fordcargotractor")!)
        let roadTruck = VehicleModel(name:"Road Truck", image: UIImage(named: "fordcargoroadtruck")!)
        let construction = VehicleModel(name: "Construction", image: UIImage(named: "fordcargoconstruction")!)
        
        hcvList = [tractor, roadTruck, construction]
        vehicleList = hcvList
    }

    fileprivate func prepareNavigationItem() {
        navigationItem.title = vehicle.name
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
        return vehicleList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TruckCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TruckCollectionViewCell", for: indexPath)as? TruckCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.truckCollectionCellLabel.text = vehicleList[indexPath.row].name
        cell.truckCollectionCellImageView.image = vehicleList[indexPath.row].image

        

    
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

