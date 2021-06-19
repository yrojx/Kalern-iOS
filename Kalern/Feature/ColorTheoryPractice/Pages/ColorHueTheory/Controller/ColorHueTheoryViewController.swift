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
    @IBOutlet weak var colorHueTheoryImage: UIImageView!
    @IBOutlet weak var colorHueTheoryTitle: UILabel!
    @IBOutlet weak var colorHueTheoryDesc: UILabel!
    
    var index: Int = 0
    
    let repository = ColorTheoryPracticeRepository.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setColorHueTheoryContent()
    }
    
    @IBAction func previousBtnPressed(_ sender: UIButton) {
        if index > 0 {
            index -= 1
        } else {
            index = 2
        }
        setColorHueTheoryContent()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if index < 2 {
            index += 1
        } else {
            index = 0
        }
        setColorHueTheoryContent()
    }
    
    private func setColorHueTheoryContent() {
        colorHueTheoryTitle.text = repository.colorHueTheories[index].type.rawValue
        
        colorHueTheoryImage.image = repository.colorHueTheories[index].type.getImage()
        
        colorHueTheoryDesc.text = repository.colorHueTheories[index].description
    }
    
    @IBAction func btnPracticeTheoryTapped(_ sender: Any) {
        repository.pickedColorHueTheory = repository.colorHueTheories[index]
        
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
