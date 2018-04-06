//
//  TruckCollectionViewCell.swift
//  Online User Manuel
//
//  Created by seda üzüm on 6.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class TruckCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var truckCollectionCellLabel: UILabel!
    @IBOutlet weak var truckCollectionCellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareTruckCollectionImageView()
        prepareTruckCollectionCellLabel()
        
    }
    
    fileprivate func prepareTruckCollectionImageView() {
        truckCollectionCellImageView.contentMode = .scaleAspectFit
        truckCollectionCellImageView.clipsToBounds = true
    }
    fileprivate func prepareTruckCollectionCellLabel() {
        truckCollectionCellLabel.textColor = .black
        truckCollectionCellLabel.font =  UIFont.boldSystemFont(ofSize: 24)
    }
    
    
  

}
