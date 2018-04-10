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
        
        let yeniFocus = VehicleModel(name: "Yeni Focus", image: UIImage(named: "yenifocus")!,poster: UIImage(named: "posterYeniFocus")!)
        let fiesta = VehicleModel(name: "Yeni Fiesta", image: UIImage(named: "fiesta")!,poster: UIImage(named: "posterYeniFiesta")!)
        let focus = VehicleModel(name: "Focus", image: UIImage(named: "focus")!,poster: UIImage(named: "posterFocus")!)
        let mondeo = VehicleModel(name: "Mondeo", image: UIImage(named: "mondeo")!,poster: UIImage(named: "posterMondeo")!)
        let ecosport = VehicleModel(name: "Yeni Ecosport", image: UIImage(named: "ecosport")!,poster: UIImage(named: "posterEcosport")!)
        let kuga = VehicleModel(name: "Yeni Kuga", image: UIImage(named: "kuga")!,poster: UIImage(named: "posterKuga")!)
        let edge = VehicleModel(name: "Edge", image: UIImage(named: "edge")!,poster: UIImage(named: "posterEdge")!)
        let cMax = VehicleModel(name: "C-Max", image: UIImage(named: "cmax")!,poster: UIImage(named: "posterCmax")!)
        let sMax = VehicleModel(name: "S-Max", image: UIImage(named: "smax")!,poster: UIImage(named: "posterSmax")!)
        let galaxy = VehicleModel(name: "Galaxy", image: UIImage(named: "galaxy")!,poster: UIImage(named: "posterGalaxy")!)
        let mustang = VehicleModel(name: "Yeni Mustang", image: UIImage(named: "mustang")!,poster: UIImage(named: "posterMustang")!)
        
        passengerCarList = [yeniFocus,fiesta,focus,mondeo,ecosport,kuga,edge,cMax,sMax,galaxy,mustang]
        vehicleList = passengerCarList
    }
    
    fileprivate func prepareLcvList(){
        
        let tourneoCourier = VehicleModel(name: "Tourneo Courier", image: UIImage(named: "tourneoCourier")!,poster: UIImage(named: "posterTourneoCourier")!)
        let tourneoConnect = VehicleModel(name: "Tourneo Connect", image: UIImage(named: "tourneoConnect")!,poster: UIImage(named: "posterTourneoConnect")!)
        let tourneoCustom = VehicleModel(name: "Tourneo Custom", image: UIImage(named: "tourneoCustom")!,poster: UIImage(named: "posterTourneoCustom")!)
        let transitCourier = VehicleModel(name: "Transit Courier", image: UIImage(named: "transitCourier")!,poster: UIImage(named: "posterTransitCourier")!)
        let transitConnect = VehicleModel(name: "Transit Connect", image: UIImage(named: "transitConnect")!,poster: UIImage(named: "posterTransitConnect")!)
        let transitCustom = VehicleModel(name: "Transit Custom", image: UIImage(named: "transitCustom")!,poster: UIImage(named: "posterTransitCustom")!)
        let transitVan = VehicleModel(name: "Transit Van", image: UIImage(named: "transitVan")!,poster: UIImage(named: "posterTransitVan")!)
        let transitKamyonet = VehicleModel(name: "Transit Kamyonet", image: UIImage(named: "transitKamyonet")!,poster: UIImage(named: "posterTransitKamyonet")!)
        let ranger = VehicleModel(name: "Ranger", image: UIImage(named: "ranger")!,poster: UIImage(named: "posterRanger")!)

        lcvList = [tourneoCourier,tourneoConnect,tourneoCustom,transitCourier,transitConnect,transitCustom,transitVan,transitKamyonet,ranger]
        vehicleList = lcvList
        
    }
    
    
    fileprivate func prepareHcvList() {
        
        let tractor = VehicleModel(name: "Çekici Serisi", image: UIImage(named: "fordcargotractor")!,poster: UIImage(named: "posterCekici")!)
        let roadTruck = VehicleModel(name:"Yol Serisi", image: UIImage(named: "fordcargoroadtruck")!,poster: UIImage(named: "posterYol")!)
        let construction = VehicleModel(name: "Inşaat Serisi", image: UIImage(named: "fordcargoconstruction")!,poster: UIImage(named: "posterInsaat")!)
        
        hcvList = [tractor, roadTruck, construction]
        vehicleList = hcvList
    }

    fileprivate func prepareNavigationItem() {
        navigationItem.title = vehicle.name + " Araç"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }

    func showDetail(_ index: Int) {
        let storyboard  = UIStoryboard(name:"Menu", bundle:nil)
        guard let driverGuideViewController = storyboard.instantiateViewController(withIdentifier: "DriversGuideViewController") as? DriversGuideViewController else {
            return
        }
        
        driverGuideViewController.type = vehicle
        driverGuideViewController.model = vehicleList[index]
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

