//
//  TemplateViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class TemplateViewController: UIViewController {

    @IBOutlet weak var viewTemplate: TemplateView!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var btnShowObject: UIButton!
    @IBOutlet var colorPaletteView: [ColorDotView]!
    
    let repository = ColorTheoryPracticeRepository.shared
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for view in viewTemplate.objectViews{
            view.addGestureRecognizer(setTemplateGesture())
        }
        
        repository.modifiedColorPallete?.initColorPalleteView(colorDotViews: colorPaletteView)
    }
    
    func setTemplateGesture() -> UITapGestureRecognizer{
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapTemplate(_:)))
        return tapRecognizer
    }
    
    @objc func handleTapTemplate(_ sender: UITapGestureRecognizer? = nil){
        print(sender?.view?.tag)
        viewTemplate.activeObjectviewIndex = sender?.view?.tag ?? 1
        setObjectsViewBorder()
    }
    
    func setObjectsViewBorder(){
        for (idx, view) in viewTemplate.objectViews.enumerated() {
            if idx == viewTemplate.activeObjectviewIndex{
                view.layer.borderWidth = 5
                view.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            } else {
                view.layer.borderWidth = 0
            }
        }
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
