//
//  InfoCardDisplayView.swift
//  Urth
//
//  Created by Lerma, Ociel(AWF) on 12/8/19.
//  Copyright © 2019 Lerma, Ociel. All rights reserved.
//

import UIKit

class InfoCardDetailView: UIView {
    
    // Properties
    
    let coordinates: UITextView = {
        let c = UITextView(frame: .zero)
        c.isUserInteractionEnabled = false
        c.textAlignment = .left
        c.tintColor = .clear
        c.textColor = .black
        c.backgroundColor = #colorLiteral(red: 0.4102995396, green: 0.6531198621, blue: 0.2377773523, alpha: 1)
        c.font = UIFont(name: "San Francisco", size: 12)
        c.accessibilityIdentifier = "coordinates_txt_view"
        return c
    }()
    
    let place: UITextView = {
        let c = UITextView(frame: .zero)
        c.font = UIFont(name: "San Francisco", size: 12)
        c.tintColor = .clear
        c.textColor = .black
        c.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        c.layer.borderWidth = 1
        c.accessibilityIdentifier = "place_txt_view"
        return c
    }()
    let date: UITextView = {
        let c = UITextView(frame: .zero)
        c.font = UIFont(name: "San Francisco", size: 12)
        c.textAlignment = .left
        c.backgroundColor = #colorLiteral(red: 0.4102995396, green: 0.6531198621, blue: 0.2377773523, alpha: 1)
        c.tintColor = .clear
        c.textColor = .black
        c.accessibilityIdentifier = "date_txt_view"
        return c
    }()
    let magnitude: UITextView = {
        let c = UITextView(frame: .zero)
        c.tintColor = .clear
        c.textColor = .black
        c.font = UIFont(name: "San Francisco", size: 12)
        c.layer.cornerRadius = 10
        c.backgroundColor = #colorLiteral(red: 1, green: 0.3548612595, blue: 0.3393234015, alpha: 1)
        c.accessibilityIdentifier = "magnitude_txt_view"
        return c
    }()

    lazy var stackview: UIStackView = {
        let stk = UIStackView(arrangedSubviews: [place, date, coordinates])
        stk.axis = .vertical
        stk.distribution = .fillEqually
        return stk
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    func setupViews() {
        stackview.backgroundColor = #colorLiteral(red: 0.4102995396, green: 0.6531198621, blue: 0.2377773523, alpha: 1)
        clipsToBounds = true
        addSubview(stackview)
        addSubview(magnitude)
        stackview.anchor(top: topAnchor, leading: leadingAnchor,
                     bottom: bottomAnchor, trailing: trailingAnchor,
                     centerXaxis: nil, centerYaxis: nil)
        
        magnitude.anchor(top: nil, leading: nil,
                         bottom: bottomAnchor, trailing: trailingAnchor,
                         centerXaxis: nil, centerYaxis: nil,
                         padding: .init(top: 0, left: 0, bottom: -12, right: -15),
                         size: .init(width: 60, height: 40))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
