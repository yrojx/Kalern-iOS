//
//  ColorHierarchyViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class ColorHierarchyViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet var colorHierarchyViews: [UIView]!
    @IBOutlet var colorPallete: [ColorDotView]!
    
    var index = 0
    
    let repository = ColorTheoryPracticeRepository.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (idx, view) in colorHierarchyViews.enumerated() {
            view.tag = idx
            view.backgroundColor = .lightGray
            view.addGestureRecognizer(setColorHierarchyGesture())
        }
        
        setColorHierarchyViewBorder()
        
        for (idx, colorDot) in colorPallete.enumerated() {
            colorDot.tag = idx
            colorDot.addGestureRecognizer(setColorPalleteGesture())
        }

        repository.colorPallete?.initColorPalleteView(colorDotViews: colorPallete)
    }
    
    @IBAction func btnNextTapped(_ sender: Any) {
        var flag = false
        for  colorDotView in colorPallete {
            flag = false
            for view in colorHierarchyViews {
                if colorDotView.colorDot?.color == view.backgroundColor {
                    flag = true
                }
            }
            if !flag {
                break
            }
        }
        
        if flag {
            for (idx, view) in colorHierarchyViews.enumerated() {
                repository.colorPallete?.colors[idx] = view.backgroundColor ?? UIColor()
            }
            
            performSegue(withIdentifier: "goToShadesTint", sender: self)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnNext.layer.cornerRadius = 10
        
        self.navigationItem.title = "Color Palette"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    
    func setColorHierarchyViewBorder() {
        for view in colorHierarchyViews {
            if view.tag == index {
                view.layer.borderWidth = 5
                view.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            } else {
                view.layer.borderWidth = 0
            }
        }
    }
    
    func setColorHierarchyGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapColorHierarchy(_:)))
        
        return tapRecognizer
    }
    
    
    @objc func handleTapColorHierarchy(_ sender: UITapGestureRecognizer? = nil) {
        index = sender?.view?.tag ?? 0
        setColorHierarchyViewBorder()
    }
    
    func setColorPalleteGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapColorPallete(_:)))
        
        return tapRecognizer
    }
    
    @objc func handleTapColorPallete(_ sender: UITapGestureRecognizer? = nil) {
        guard let colorPalleteIndex = sender?.view?.tag else { return }
        
        configureColorHierarchyViews(idx: colorPalleteIndex)
        
        colorHierarchyViews[index].backgroundColor = colorPallete[colorPalleteIndex].colorDot?.color
        
        configureNextButton()
    }
    
    
    func configureColorHierarchyViews(idx: Int) {
        for view in colorHierarchyViews {
            if view.backgroundColor == colorPallete[idx].colorDot?.color {
                view.backgroundColor = colorHierarchyViews[index].backgroundColor
            }
        }
    }
    
    func configureNextButton() {
        var flag = true
        
        for view in colorHierarchyViews {
            if view.backgroundColor == .lightGray {
                flag = false
            }
        }
        
        if flag {
            btnNext.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.4392156863, blue: 0, alpha: 1)
            btnNext.isEnabled = true
        }
    }
}
