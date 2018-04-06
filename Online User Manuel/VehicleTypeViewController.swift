//
//  VehicleTypeViewController.swift
//  Online User Manuel
//
//  Created by seda üzüm on 5.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

struct VehicleType {
    
    var name: String
    var image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}

class VehicleTypeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var vehicleTypeList: [VehicleType]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareVehicleList()
        prepareNavigationItem()
        prepareTableView()
        
    }

    func showDetail(_ index: Int) {
        let storyboard  = UIStoryboard(name:"Main", bundle:nil)
        guard let truckCollectionViewController = storyboard.instantiateViewController(withIdentifier: "TruckCollectionViewController") as? TruckCollectionViewController else {
            return
        }
        //movieDet.myMovie = movieArray[index]
        self.navigationController?.pushViewController(truckCollectionViewController, animated: true)
    }
    
    fileprivate func prepareVehicleList() {
        let binekArac = VehicleType(name: "Binek Araç", image: UIImage(named: "fordfocuswhite")!)
        let ticariArac = VehicleType(name:"Ticari Araç", image: UIImage(named: "fordtourneocustom")! )
        let kamyonImg = UIImage(named: "fordcargo")!
        let kamyonlar = VehicleType(name: "Kamyonlar", image: UIImage(cgImage: kamyonImg.cgImage!, scale: 1.0, orientation: UIImageOrientation.upMirrored ))
        vehicleTypeList = [binekArac,ticariArac,kamyonlar]
        
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
        return vehicleTypeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: VehicleTypeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VehicleTypeTableViewCell") as! VehicleTypeTableViewCell
        
        cell.vehicleTypeLabel.text = vehicleTypeList[indexPath.row].name
        cell.vehicleTypeImage.image = vehicleTypeList[indexPath.row].image
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        showDetail(index)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
