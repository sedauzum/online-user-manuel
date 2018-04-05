//
//  GuideCategoryTableViewCell.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 5.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class GuideCategoryTableViewCell: UITableViewCell {


    @IBOutlet weak var goArrow: UIImageView!
    @IBOutlet weak var guideCategoryImageView: UIImageView!
    @IBOutlet weak var guideCategoryExpLabel: UILabel!
    @IBOutlet weak var guideCategoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareCategoryView()
        prepareLabels()
      
    }
    
    fileprivate func prepareCategoryView(){
        
        guideCategoryImageView.contentMode = .scaleAspectFill
        guideCategoryImageView.clipsToBounds = true
        goArrow.image = UIImage(named: "next_icon")
        
        
        
    }
    
    fileprivate func prepareLabels(){

        guideCategoryLabel.font = UIFont.systemFont(ofSize: 20.0)
        guideCategoryExpLabel.font = UIFont.systemFont(ofSize: 12.0)
        guideCategoryExpLabel.textColor = . gray
 
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
