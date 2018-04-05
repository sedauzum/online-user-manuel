//
//  DriverGuide.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 3.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import Foundation
import UIKit

class DriverGuide {
    
    var title: String
    var imageView: UIImage
    var type: guideType
    
    
    required init(title: String, imageView: UIImage, type: guideType) {
        
        self.title = title
        self.imageView = imageView
        self.type = type
        
    }
   
}

class GuideCategory {
    
    var title: String
    var imageView: UIImage
    var description: String
    
    
    required init(title: String, imageView: UIImage, description: String) {
        
        self.title = title
        self.imageView = imageView
        self.description = description
        
    }

}

enum guideType {
    
    case kullanimkilavuzu
    case kontrolikaz
    case sss
    case okumaisareti
    case anismasyonlar
    case hizlibaglantilar
    
}
