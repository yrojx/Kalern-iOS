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
    @IBOutlet var shadeViews: [ColorDotView]!
    @IBOutlet var tintViews: [ColorDotView]!
    @IBOutlet var colorPalleteView: [ColorDotView]!
    @IBOutlet weak var colorHueImageView: UIImageView!
    
    var repository = ColorTheoryPracticeRepository.shared
    
    var activeColorPalleteIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository.modifiedColorPallete = repository.colorPallete
        
        repository.initShadesAndTint()
        
        repository.modifiedColorPallete?.initColorPalleteView(colorDotViews: colorPalleteView)
        
        repository.modifiedColorPallete?.setColorPalleteBorder(activeIndex: activeColorPalleteIndex, colorPalleteVeiw: colorPalleteView)
        
        initShadeAndTintViews()
        initColorPalleteView()
        
        
        setupShadeAndTintViews()
    }
    
    @IBAction func btnNextTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToInstructions", sender: self)
    }
    
    private func initColorPalleteView() {
        colorHueImageView.tintColor = colorPalleteView[activeColorPalleteIndex].colorDot?.color
        for (idx, colorDot) in colorPalleteView.enumerated() {
            colorDot.tag = idx
            colorDot.addGestureRecognizer(setColorPalleteGesture())
        }
    }
    
    private func initShadeAndTintViews() {
        for (idx, tintView) in tintViews.enumerated() {
            tintView.tag = idx
            shadeViews[idx].tag = idx + 5
            tintView.addGestureRecognizer(setGesture())
            shadeViews[idx].addGestureRecognizer(setGesture())
        }
    }
    
    func setColorPalleteGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleColorPalleteTap(_:)))
        
        return tapRecognizer
    }
    
    @objc func handleColorPalleteTap(_ sender: UITapGestureRecognizer? = nil) {
        activeColorPalleteIndex = sender?.view?.tag ?? 0
        repository.colorPallete?.setColorPalleteBorder(activeIndex: activeColorPalleteIndex, colorPalleteVeiw: colorPalleteView)
        setupShadeAndTintViews()
        colorHueImageView.tintColor = colorPalleteView[activeColorPalleteIndex].colorDot?.color
    }
    
    
    func setGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        return tapRecognizer
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let tag = sender?.view?.tag else {return}
        
        if tag < 5 {
            colorPalleteView[activeColorPalleteIndex].colorDot?.color = tintViews[tag].colorDot?.color ?? UIColor()
        } else {
            colorPalleteView[activeColorPalleteIndex].colorDot?.color = shadeViews[tag - 5].colorDot?.color ?? UIColor()
        }
    }
    
    private func setupShadeAndTintViews() {
        for (idx, shadeView) in shadeViews.enumerated() {
            shadeView.colorDot = ColorDot(id: idx, color: repository.shades[activeColorPalleteIndex][idx])
            
            tintViews[idx].colorDot = ColorDot(id: idx, color: repository.tints[activeColorPalleteIndex][idx])
        }
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
