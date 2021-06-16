//
//  HueAssesmentViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class HueAssesmentViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var viewBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnNextTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToColorPalette", sender: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        btnNext.layer.cornerRadius = 10
        
        viewBackground.layer.cornerRadius = 10
        
        viewBackground.layer.borderColor = #colorLiteral(red: 0.9864340425, green: 0.3019824326, blue: 0, alpha: 1)
        viewBackground.layer.borderWidth = 1
        
        self.navigationItem.title = "Hue Practice"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    
}
