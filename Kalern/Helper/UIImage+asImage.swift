//
//  UIView+asImage.swift
//  Kalern
//
//  Created by Michael Tanakoman on 21/06/21.
//

import UIKit

extension UIImage{
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
                self.init(cgImage: image!.cgImage!)
    }
}
