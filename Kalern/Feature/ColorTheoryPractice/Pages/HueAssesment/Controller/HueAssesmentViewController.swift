//
//  HueAssesmentViewController.swift
//  Kalern
//
//  Created by Michael Tanakoman on 14/06/21.
//

import UIKit

class HueAssesmentViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var colorWheelView: ColorWheelView!
    @IBOutlet var colorPallete: [ColorDotView]!
    @IBOutlet weak var assesmentImageView: UIImageView!
    @IBOutlet weak var colorHueTheoryTitleLabel: UILabel!
    
    var index: Int = 0
    
    var defaultColorPallete = UIColor(red: 227, green: 228, blue: 230, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorWheelView.delegate = self
        
        for (idx, colorDotView) in colorWheelView.colorDotViews.enumerated() {
            colorDotView.colorDot = ColorDot(id: idx, color: ColorWheel.colors[idx] ?? .red)
        }
        
        for (idx, colorDotView) in colorPallete.enumerated() {
            colorDotView.colorDot = ColorDot(id: idx, color: defaultColorPallete)
            colorDotView.addGestureRecognizer(setColorPalleteGesture())
        }
        
        colorHueTheoryTitleLabel.text = ColorTheoryPracticeRepository.shared.pickedColorHueTheory?.type.rawValue
        
        setColorPalleteBorder()
    
    }
    
    func setColorPalleteGesture() -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        return tapRecognizer
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        index = sender?.view?.tag ?? 0
        setColorPalleteBorder()
    }
    
    private func setColorPalleteBorder() {
        for (idx, colorDot) in colorPallete.enumerated() {
            if idx == index {
                colorDot.colorDotView.layer.borderWidth = 5
            } else {
                colorDot.colorDotView.layer.borderWidth = 0
            }
        }
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToColorPalette", sender: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        btnNext.layer.cornerRadius = 10
        self.navigationItem.title = "Hue Practice"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    
    func assesColorTheory() {
        var isFilledAll = true
        for colorDotView in colorPallete {
            if colorDotView.colorDot?.color == defaultColorPallete {
                isFilledAll = false
            }
        }
        
        if isFilledAll {
            checkColorTheory()
        }
    }
    
    private func checkColorTheory() {
        var flag = false
        var pickedColorPair = [Int]()
        for colorDot in colorPallete {
            pickedColorPair.append(colorDot.colorDot?.id ?? 0)
        }
        
        pickedColorPair.sort()
        
        if let colorPairs = ColorTheoryPracticeRepository.shared.pickedColorHueTheory?.colorPairs {
            for colorPair in colorPairs {
                if colorPair == pickedColorPair {
                    flag = true
                    
                    break
                }
            }
        }
        if flag {
            btnNext.alpha = 1
            btnNext.isEnabled = true
            assesmentImageView.image = UIImage(systemName: "checkmark.circle.fill")
            assesmentImageView.tintColor = #colorLiteral(red: 0, green: 0.5764705882, blue: 0, alpha: 1)
        } else {
            assesmentImageView.image = UIImage(systemName: "x.circle.fill")
            assesmentImageView.tintColor = #colorLiteral(red: 0.9921568627, green: 0.3254901961, blue: 0.03137254902, alpha: 1)
        }
    }
    
}

extension HueAssesmentViewController: ColorWheelViewDelegate {
    func colorDotView(id: Int, color: UIColor) {
        if index >= 0 && index <= 2 {
            colorPallete[index].colorDot? = ColorDot(id: id, color: color)
            index += 1
            setColorPalleteBorder()
            assesColorTheory()
        }
    }
}
