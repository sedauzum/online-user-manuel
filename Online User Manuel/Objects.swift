//
//  DriverGuide.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 3.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import Foundation
import UIKit


struct VehicleType {
    
    var name: String
    var image: UIImage
    var type: vehicleType
    
    init(name: String, image: UIImage, type: vehicleType) {
        self.name = name
        self.image = image
        self.type = type
    }
}

struct VehicleModel {
    
    var name: String
    var image: UIImage
    var poster: UIImage?
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
    init(name: String, image: UIImage, poster: UIImage) {
        self.name = name
        self.image = image
        self.poster = poster
    }
}

struct DriverGuide {
    
    var title: String
    var imageView: UIImage
    var type: guideType
    
    init(title: String, imageView: UIImage, type: guideType) {
        
        self.title = title
        self.imageView = imageView
        self.type = type
        
    }
   
}

struct GuideCategory {
    
    var title: String
    var imageView: UIImage
    var description: String
    
    
    init(title: String, imageView: UIImage, description: String) {
        
        self.title = title
        self.imageView = imageView
        self.description = description
        
    }

}

struct FaqQuestion {
    
    var question: String
    var answer: String
    var questionID: String
    
    
    init(question: String, answer: String, questionID: String) {
        
        self.question = question
        self.answer = answer
        self.questionID = questionID
        
    }
    
}

enum vehicleType {
    case binek
    case ticari
    case agirTicari
}


enum guideType {
    
    case kullanimkilavuzu
    case kontrolikaz
    case sss
    case okumaisareti
    case anismasyonlar
    case hizlibaglantilar
    
}
