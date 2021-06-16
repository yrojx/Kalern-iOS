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
    @IBOutlet weak var colorWheelView: ColorWheelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (idx, colorDotView) in colorWheelView.colorDotViews.enumerated() {
            colorDotView.colorDot = ColorDot(id: idx, color: ColorWheel.colors[idx] ?? .red)
        }
    }
    
    @IBAction func btnStartUIPracticeTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToColorHueTheory", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnStartUIPractice.layer.borderWidth = 1
        btnStartUIPractice.layer.borderColor = #colorLiteral(red: 1, green: 0.3600544035, blue: 0, alpha: 1)
        
        self.navigationController?.isNavigationBarHidden = true
    }
}
