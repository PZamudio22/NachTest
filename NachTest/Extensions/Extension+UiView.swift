//
//  Extension+UiView.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

extension UIView {
    func roundedObject(isCircle: Bool, size: CGFloat) {
        switch isCircle {
        case true:
            self.layer.cornerRadius = self.bounds.width / 2
        default:
            self.layer.cornerRadius = size
        }
    }
    
}
