//
//  ColorHueTheoryViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class ColorHueTheoryViewController: UIViewController {

    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var btnPracticeTheory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnPracticeTheoryTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToHueAssesment", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewTitle.layer.borderColor = #colorLiteral(red: 1, green: 0.3600544035, blue: 0, alpha: 1)
        viewTitle.layer.borderWidth = 1
        viewTitle.layer.cornerRadius = 20
        
        btnPracticeTheory.layer.cornerRadius = 10
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Color Hue Theory"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    
}
