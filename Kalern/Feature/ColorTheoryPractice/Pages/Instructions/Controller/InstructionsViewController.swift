//
//  InstructionsViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class InstructionsViewController: UIViewController {

    @IBOutlet weak var btnStartUIPractice: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnStartUIPractice(_ sender: Any) {
        performSegue(withIdentifier: "goToTemplate", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnStartUIPractice.layer.cornerRadius = 10
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
}
