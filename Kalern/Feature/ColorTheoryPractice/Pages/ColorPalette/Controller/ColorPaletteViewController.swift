//
//  ColorPaletteViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class ColorPaletteViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var viewPrimary: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnNextTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToShadesTint", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnNext.layer.cornerRadius = 10
        
        viewPrimary.layer.borderWidth = 5
        viewPrimary.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        self.navigationItem.title = "Color Palette"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }

}
