//
//  TemplateViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class TemplateViewController: UIViewController {

    @IBOutlet weak var viewTemplate: UIView!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var btnShowObject: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewTemplate.layer.cornerRadius = 10
        viewTemplate.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewTemplate.layer.borderWidth = 2
        
        viewBackground.layer.cornerRadius = 10
        viewBackground.layer.borderWidth = 1
        viewBackground.layer.borderColor = #colorLiteral(red: 0.9864340425, green: 0.3019824326, blue: 0, alpha: 1)
        
        btnShowObject.layer.cornerRadius = 10
        
        self.navigationItem.title = "UI Color Practice"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: nil, action: nil)
        
    }
}
