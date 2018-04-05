//
//  VehicleTypeTableViewCell.swift
//  Online User Manuel
//
//  Created by seda üzüm on 5.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class VehicleTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var vehicleTypeImage: UIImageView!
    @IBOutlet weak var vehicleTypeLabel: UILabel!
    @IBOutlet weak var nextIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareVehicleTypeImage()
        prepareVehicleTypeLabel()
        prepareNextIcon()
        
    }
    
    fileprivate func prepareVehicleTypeImage() {
        vehicleTypeImage.contentMode = .scaleAspectFit
        vehicleTypeImage.clipsToBounds = true
    }
    fileprivate func prepareVehicleTypeLabel() {
        vehicleTypeLabel.textColor = .black
        vehicleTypeLabel.font =  UIFont.boldSystemFont(ofSize: 24)
    }
    
    fileprivate func prepareNextIcon() {
        nextIcon.image = UIImage(named: "icon_next")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
