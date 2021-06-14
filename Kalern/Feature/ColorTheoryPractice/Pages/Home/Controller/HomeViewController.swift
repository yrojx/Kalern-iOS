//
//  HomeViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnStartLearning: UIButton!
    @IBOutlet weak var btnStartUIPractice: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnStartUIPractice.layer.borderWidth = 1
        btnStartUIPractice.layer.borderColor = #colorLiteral(red: 1, green: 0.3600544035, blue: 0, alpha: 1)
        
        self.navigationController?.isNavigationBarHidden = true
    }
}
