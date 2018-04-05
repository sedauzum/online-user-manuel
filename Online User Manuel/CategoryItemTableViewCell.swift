//
//  CategoryItemTableViewCell.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 5.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class CategoryItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var categoryItemLabel: UILabel!
    
    @IBOutlet weak var goArrow: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
         goArrow.image = UIImage(named: "next_icon")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
