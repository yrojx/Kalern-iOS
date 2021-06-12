//
//  UIView+loadViewFromNib.swift
//  Kalern
//
//  Created by Yossan Sandi Rahmadi on 13/06/21.
//

import UIKit

extension UIView {
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    }
}
