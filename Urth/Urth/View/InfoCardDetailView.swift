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
    let coordinates = [Double]()
    
    let place: UITextView = {
        let c = UITextView(frame: .zero)
        c.textColor = .black
        c.font = UIFont(name: "San Francisco", size: 15)
        return c
    }()
    let date: UITextView = {
        let c = UITextView(frame: .zero)
        c.textColor = .black
        c.font = UIFont(name: "San Francisco", size: 12)
        return c
    }()
    let magnitude: UITextView = {
        let c = UITextView(frame: .zero)
        c.textColor = .black
        c.font = UIFont(name: "San Francisco", size: 12)
        return c
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = #colorLiteral(red: 0.4068799019, green: 0.6527641416, blue: 0.2465434372, alpha: 1)
        clipsToBounds = true
    }
    
    func setupViews() {
        addSubview(place)

        
        place.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, centerXaxis: nil, centerYaxis: nil, padding: .init(top: 2, left: 2, bottom: 0, right: 2), size: .init(width: 0, height: 40))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
