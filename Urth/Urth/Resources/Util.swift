//
//  Util.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/6/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?,
                centerXaxis: NSLayoutXAxisAnchor?, centerYaxis: NSLayoutYAxisAnchor?,
                padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        // NEEDED to activate autolayout constraints
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // TOP, BOTTOM, LEFT AND RIGHT CONSTRAINTS
        // TOP AND BOTTOM ( Y AXIS )
        // LEFT AND RIGHT ( X AXIS )
        if let top = top {
            self.topAnchor.constraint(equalTo: top,
                                      constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom,
                                         constant: -padding.bottom).isActive = true
            
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing,
                                           constant: -padding.right).isActive = true
        }
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading,
                                          constant: padding.left).isActive = true
        }
        
        // CENTER X AXIS
        if let centerX = centerXaxis {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        // CENTER Y AXIS
        if let centerY = centerYaxis {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        // Set the WIDTH AND HEIGHT WHEN SPECIFIED
        if size.width != 0 {
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func setShadow(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 15
    }
}
