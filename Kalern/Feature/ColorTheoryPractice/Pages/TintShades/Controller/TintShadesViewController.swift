//
//  TintShadesViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class TintShadesViewController: UIViewController {

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnNextTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToInstructions", sender: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        viewBackground.layer.cornerRadius = 10
        viewBackground.layer.borderWidth = 2
        viewBackground.layer.borderColor = #colorLiteral(red: 1, green: 0.3600544035, blue: 0, alpha: 1)
        
        btnNext.layer.cornerRadius = 10
        
        self.navigationItem.title = "Tint & Shade"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
}
