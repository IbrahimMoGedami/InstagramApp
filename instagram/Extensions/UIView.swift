//
//  UIView.swift
//  instagram
//
//  Created by Ibrahim Mo Gedami on 7/29/22.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = nil, paddingBottom: CGFloat? = nil, paddingLeft: CGFloat? = nil, paddingRight: CGFloat? = nil, width: CGFloat? = 0, height: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop ?? 0.0).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom ?? 0.0).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft ?? 0.0).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -(paddingRight ?? 0.0)).isActive = true
        }
        
        if width != 0{
            widthAnchor.constraint(equalToConstant: width ?? 0).isActive = true
        }
        
        if height != 0{
            heightAnchor.constraint(equalToConstant: height ?? 0).isActive = true
        }
    }
}
