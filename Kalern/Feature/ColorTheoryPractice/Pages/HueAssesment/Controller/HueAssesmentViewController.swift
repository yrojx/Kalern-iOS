//
//  HueAssesmentViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class HueAssesmentViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnNextTapped(_ sender: Any) {
        
    }

    override func viewWillAppear(_ animated: Bool) {
        btnNext.layer.cornerRadius = 10
        self.navigationItem.title = "Hue Practice"
    }
    
}
