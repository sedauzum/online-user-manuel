//
//  DriverGuideTableViewCell.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 3.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class DriverGuideTableViewCell: UITableViewCell {

    
    @IBOutlet weak var goArrow: UIImageView!
    @IBOutlet weak var guideImageView: UIImageView!
    @IBOutlet weak var guideLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareImageView()
    }
    
    fileprivate func prepareImageView(){
        
        guideImageView.contentMode = .scaleAspectFill
        guideImageView.clipsToBounds = true
        goArrow.image = UIImage(named: "next_icon")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
