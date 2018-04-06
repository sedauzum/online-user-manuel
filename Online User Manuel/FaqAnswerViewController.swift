//
//  FaqAnswerViewController.swift
//  Online User Manuel
//
//  Created by Onur Asıliskender on 6.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//

import UIKit

class FaqAnswerViewController: UIViewController {
    
    var guide: DriverGuide!
    var question: FaqQuestion!

    @IBOutlet weak var answerBox: UITextView!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationBar()
        prepareText()

    }
    
    fileprivate func prepareNavigationBar(){
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = guide.title
        
    }
    
    fileprivate func prepareText(){
        
        questionLabel.text = question.question
        answerBox.text = question.answer
        
        questionLabel.font = UIFont.systemFont(ofSize: 18.0)
        answerBox.font = UIFont.systemFont(ofSize: 16.0)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
